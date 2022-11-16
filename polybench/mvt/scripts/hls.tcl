open_project -reset "io1_l1n1n1_l3n1n1"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y2
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 1 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3n1p1"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y2
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 1 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3p1n1"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "mvt" buff_y2
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 1 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 2 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n2_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p2n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 4 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 2 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 2 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp2"
set_directive_unroll -factor 8 "mvt/lp2"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 2 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 1 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p4_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_pipeline "mvt/lp4"
set_directive_unroll -factor 4 "mvt/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p1n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 1 "mvt/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p4n1_d1d2"
set_top mvt
add_files ../src//mvt.h
add_files ../src//mvt.c
open_solution "solution"
set_part xc7v585tffg1157-3
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "mvt" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" A
set_directive_resource -core RAM_1P "mvt" x1
set_directive_resource -core RAM_1P "mvt" x2
set_directive_resource -core RAM_1P "mvt" y1
set_directive_resource -core RAM_1P "mvt" y2
set_directive_interface -mode ap_fifo "mvt" x1_out
set_directive_interface -mode ap_fifo "mvt" x2_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "mvt" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_x2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_y2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "mvt" buff_A
set_directive_pipeline "mvt/lprd_2"
set_directive_unroll -factor 8 "mvt/lprd_2"
set_directive_pipeline "mvt/lpwr"
set_directive_unroll -factor 8 "mvt/lpwr"
set_directive_pipeline "mvt/lp1"
set_directive_unroll -factor 8 "mvt/lp1"
set_directive_pipeline "mvt/lp3"
set_directive_unroll -factor 4 "mvt/lp3"
csynth_design
close_project

