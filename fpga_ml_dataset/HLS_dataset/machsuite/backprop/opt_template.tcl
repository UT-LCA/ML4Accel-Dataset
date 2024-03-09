set_directive_resource -core RAM_1P_BRAM "backprop" weights1
set_directive_resource -core RAM_1P_BRAM "backprop" weights2
set_directive_resource -core RAM_1P_BRAM "backprop" weights3
set_directive_resource -core RAM_1P_BRAM "backprop" biases1
set_directive_resource -core RAM_1P_BRAM "backprop" biases2
set_directive_resource -core RAM_1P_BRAM "backprop" training_data
set_directive_resource -core RAM_1P_BRAM "backprop" training_targets

set_directive_inline RELU
set_directive_inline add_bias_to_activations

#dim = 7
array_partition,16,[1 2 4 8 16 32 64],[cyclic]
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" activations1 
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" activations2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" dactivations1
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" dactivations2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" delta_weights1
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" delta_weights2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" delta_weights3
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" oracle_activations1
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" oracle_activations2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" weights1
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" weights2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" weights3
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" biases1
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" biases2
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" training_data
set_directive_array_partition -factor [factor] -type [type] -dim 1 "backprop" training_targets


#dim = 7 
loop_opt,1,20
0,up_weight_loop,pipeline,unroll,[2 4 8 16 32 64]
set_directive_unroll -factor [factor] bfs/up_weight_loop1
set_directive_unroll -factor [factor] bfs/up_weight_loop2
set_directive_unroll -factor [factor] bfs/up_weight_loop3
set_directive_unroll -factor [factor] bfs/up_weight_loop4
set_directive_unroll -factor [factor] bfs/up_weight_loop5
set_directive_unroll -factor [factor] bfs/up_weight_loop6
set_directive_unroll -factor [factor] bfs/up_weight_loop7
set_directive_unroll -factor [factor] bfs/up_weight_loop8
set_directive_unroll -factor [factor] bfs/up_weight_loop9
set_directive_unroll -factor [factor] bfs/up_weight_loop10
set_directive_pipeline bfs/up_weight_loop1
set_directive_pipeline bfs/up_weight_loop2
set_directive_pipeline bfs/up_weight_loop3
set_directive_pipeline bfs/up_weight_loop4
set_directive_pipeline bfs/up_weight_loop5
set_directive_pipeline bfs/up_weight_loop6
set_directive_pipeline bfs/up_weight_loop7
set_directive_pipeline bfs/up_weight_loop8
set_directive_pipeline bfs/up_weight_loop9
set_directive_pipeline bfs/up_weight_loop10

#dim = 7
loop_opt,1,16
0,compute_loop,pipeline,unroll,[2 4 8 16 32 64]
set_directive_unroll -factor [factor] bfs/delta_matrix_weights1_loop
set_directive_unroll -factor [factor] bfs/delta_matrix_weights2_loop
set_directive_unroll -factor [factor] bfs/delta_matrix_weights3_loop
set_directive_unroll -factor [factor] bfs/activations1_loop
set_directive_unroll -factor [factor] bfs/activations2_loop
set_directive_unroll -factor [factor] bfs/mvp_product_loop1
set_directive_unroll -factor [factor] bfs/mvp_product_loop2
set_directive_unroll -factor [factor] bfs/mvp_product_input_loop
set_directive_pipeline bfs/delta_matrix_weights1_loop
set_directive_pipeline bfs/delta_matrix_weights2_loop
set_directive_pipeline bfs/delta_matrix_weights3_loop
set_directive_pipeline bfs/activations1_loop
set_directive_pipeline bfs/activations2_loop
set_directive_pipeline bfs/mvp_product_loop1
set_directive_pipeline bfs/mvp_product_loop2
set_directive_pipeline bfs/mvp_product_input_loop
