set COUNT 192

open_project -reset "io4_l1p1n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p1n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p1n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p2n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p2n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io4_l1p4n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 4 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io4_l1p4n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n2_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n2_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n4_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n4_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1n8_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1n8_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 1 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p2_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 2 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p2_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p4_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 4 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p4_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1n1p8_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp2"
set_directive_unroll -factor 8 "atax/lp2"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1n1p8_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p1n1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 1 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p1n1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p2n1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 2 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p2n1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p4n1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 4 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p4n1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1n8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1n8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 1 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p2_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 2 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p2_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p4"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p4"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p4_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 4 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p4_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p8"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p8"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3n1p8_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp4"
set_directive_unroll -factor 8 "atax/lp4"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3n1p8_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p1n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p1n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p1n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 1 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p1n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p2n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p2n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p2n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 2 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p2n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p4n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p4n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p4n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 4 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p4n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p8n1"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p8n1"
puts "count: $COUNT"
puts "----------------------------------"

open_project -reset "io8_l1p8n1_l3p8n1_d1d2"
set_top atax
add_files ../src/atax.h
add_files ../src/atax.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "atax" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" A
set_directive_resource -core RAM_1P "atax" x
set_directive_interface -mode ap_fifo "atax" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "atax" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "atax" buff_A
set_directive_pipeline "atax/lprd_2"
set_directive_unroll -factor 8 "atax/lprd_2"
set_directive_pipeline "atax/lpwr_1"
set_directive_unroll -factor 8 "atax/lpwr_1"
set_directive_pipeline "atax/lp1"
set_directive_unroll -factor 8 "atax/lp1"
set_directive_pipeline "atax/lp3"
set_directive_unroll -factor 8 "atax/lp3"
csynth_design
close_project
incr COUNT
puts "-----------finshed----------------"
puts "project_name: io8_l1p8n1_l3p8n1_d1d2"
puts "count: $COUNT"
puts "----------------------------------"

