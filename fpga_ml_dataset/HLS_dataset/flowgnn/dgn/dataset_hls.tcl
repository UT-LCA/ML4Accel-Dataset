open_project -reset project
set_top DGN_compute_graphs
add_files src/DGN_compute.cc
add_files src/conv_layer.cc
add_files src/finalize.cc
add_files src/globals.cc
add_files src/linear.cc
add_files src/load_inputs.cc
add_files src/message_passing.cc
add_files src/node_embedding.cc
add_files -tb testbench/main.cc -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb testbench/load.cc -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb g1_node_feature.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb g1_info.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb g1_edge_list.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb g1_edge_attr.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb eig_g1.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dgn_ep1_noBN_dim100.weights.all.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dgn_ep1_nd_embed_dim100.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dgn_conv_weights_dim100.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb dgn_conv_bias_dim100.bin -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution -reset solution1 -flow_target vitis
set_part {xcu50-fsvh2104-2-e}
create_clock -period 300MHz -name default
csynth_design
