open_project -reset hls_prj
set_top mvt
add_files src/mvt.c
add_files src/mvt.h
open_solution -reset solution
set_part xczu9eg-ffvb1156-2-i
create_clock -period 10 -name default
# source [opt_tcl]
csynth_design
close_project
