open_project -reset [prj_path]
set_top gemm
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/gemm/ncubed/gemm.c
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/gemm/ncubed/gemm.h
open_solution -reset solution
set_part xczu9eg-ffvb1156-2-i
create_clock -period 10 -name default
source [opt_tcl]
csynth_design
close_project

