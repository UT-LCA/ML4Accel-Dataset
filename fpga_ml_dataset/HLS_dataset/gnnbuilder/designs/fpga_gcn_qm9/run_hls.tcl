open_project -reset fpga_gcn_qm9_vitis_hls_project

add_files gnn_builder_lib.h
add_files model.h
add_files model.cpp

add_files -tb model_tb.cpp
add_files -tb tb_data

set_top fpga_gcn_qm9_top

open_solution "solution1" -flow_target vitis
set_part xczu9eg-ffvb1156-2-e
create_clock -period 3.33 -name default

csynth_design
# export_design -format ip_catalog -rtl verilog -display_name fpga_gcn_qm9