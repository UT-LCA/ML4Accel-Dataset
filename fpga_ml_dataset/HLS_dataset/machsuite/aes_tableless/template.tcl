set_directive_resource -core RAM_1P_BRAM "aes256_encrypt_ecb" k
set_directive_resource -core RAM_1P_BRAM "aes256_encrypt_ecb" buf
#set_directive_inline gf_alog
#set_directive_inline gf_log
#set_directive_inline gf_mulinv
#set_directive_inline rj_sbox
set_directive_inline rj_xtime
#set_directive_inline aes_subBytes
#set_directive_inline aes_addRoundKey
#set_directive_inline aes_addRoundKey_cpy
set_directive_inline aes_shiftRows
#set_directive_inline aes_mixColumns
#set_directive_inline aes_expandEncKey

#dim = 5
array_partition,3,[1 2 4 8 16],[cyclic]
set_directive_array_partition -factor [factor] -type [type] -dim 1 "aes256_encrypt_ecb" k 
set_directive_array_partition -factor [factor] -type [type] -dim 1 "aes256_encrypt_ecb" buf

#dim = 5 
loop_opt,1,2
0,sub,pipeline,unroll,[2 4 8 16]
set_directive_pipeline bfs/[name]
set_directive_unroll -factor [factor] bfs/[name]

#dim = 5
loop_opt,1,4
0,addkey/cpkey,pipeline,unroll,[2 4 8 16]
set_directive_pipeline bfs/addkey
set_directive_unroll -factor [factor] bfs/addkey
set_directive_pipeline bfs/cpkey
set_directive_unroll -factor [factor] bfs/cpkey

#dim = 3 
loop_opt,1,2
0,mix,pipeline,unroll,[2 4]
set_directive_pipeline bfs/mix
set_directive_unroll -factor [factor] bfs/mix

#dim = 2
loop_opt,1,4
0,exp1/exp2,pipeline,unroll,[3]
set_directive_pipeline bfs/exp1
set_directive_unroll -factor [factor] bfs/exp1
set_directive_pipeline bfs/exp2
set_directive_unroll -factor [factor] bfs/exp2



