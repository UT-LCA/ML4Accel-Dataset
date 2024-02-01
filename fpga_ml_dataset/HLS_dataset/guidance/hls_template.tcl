open_project -reset [prj_path]
set_top bfs
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/bfs/bulk/bfs.c
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/bfs/bulk/bfs.h
open_solution -reset solution
set_part xczu9eg-ffvb1156-2-i
create_clock -period 10 -name default
source [opt_tcl]
csynth_design
close_project

