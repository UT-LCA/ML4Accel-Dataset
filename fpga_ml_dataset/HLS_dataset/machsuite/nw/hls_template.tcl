open_project -reset [prj_path]
set_top needwun
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/nw/nw/nw.c
add_files /home/projects/ljohn/simplescalar/zhigang/MachSuite/nw/nw/nw.h
open_solution -reset solution
set_part xczu9eg-ffvb1156-2-i
create_clock -period 10 -name default
source [opt_tcl]
csynth_design
close_project

