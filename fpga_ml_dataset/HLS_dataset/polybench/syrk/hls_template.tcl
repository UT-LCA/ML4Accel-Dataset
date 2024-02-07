open_project -reset [prj_path]
set_top syrk
add_files [path_to_fpga_ml_dataset]/HLS_dataset/polybench/syrk/src/syrk.c
add_files [path_to_fpga_ml_dataset]/HLS_dataset/polybench/syrk/src/syrk.h
open_solution -reset solution
set_part xczu9eg-ffvb1156-2-i
create_clock -period 10 -name default
source [opt_tcl]
csynth_design
close_project
