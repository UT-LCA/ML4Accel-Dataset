open_project -reset project

add_files cpp_ap_int_arith.cpp
add_files -tb cpp_ap_int_arith_test.cpp
add_files -tb result.golden.dat

set_top cpp_ap_int_arith

open_solution -reset solution1
set_part  {xcvu9p-flga2104-2-i}
create_clock -period 4

csynth_design
