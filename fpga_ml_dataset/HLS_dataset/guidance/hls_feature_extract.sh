MACHSUITE="/home/projects/ljohn/simplescalar/zhigang/fpga_ml_dataset/fpga_ml_dataset/HLS_dataset/machsuite/"
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/aes/aes/output_table --kernel_name aes256_encrypt_ecb --csv_file $MACHSUITE/aes_table/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/aes/aes/output_tableless --kernel_name aes256_encrypt_ecb --csv_file $MACHSUITE/aes_tableless/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/backprop/backprop/output --kernel_name backprop --csv_file $MACHSUITE/backprop/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/bfs/bulk/output --kernel_name bfs --csv_file $MACHSUITE/bfs_bulk/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/bfs/queue/output --kernel_name bfs --csv_file $MACHSUITE/bfs_queue/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/fft/transpose/output --kernel_name fft1D_512 --csv_file $MACHSUITE/fft_transpose/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/gemm/blocked/output --kernel_name bbgemm --csv_file $MACHSUITE/gemm_blocked/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/gemm/ncubed/output --kernel_name gemm --csv_file $MACHSUITE/gemm_ncubed/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/md/grid/output --kernel_name md --csv_file $MACHSUITE/md_grid/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/md/knn/output --kernel_name md_kernel --csv_file $MACHSUITE/md_knn/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/nw/nw/output --kernel_name needwun --csv_file $MACHSUITE/nw/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/sort/merge/output --kernel_name ms_mergesort --csv_file $MACHSUITE/sort_merge/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/sort/radix/output --kernel_name ss_sort --csv_file $MACHSUITE/sort_radix/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/spmv/crs/output --kernel_name spmv --csv_file $MACHSUITE/spmv_crs/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/spmv/ellpack/output --kernel_name ellpack --csv_file $MACHSUITE/spmv_ellpack/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/stencil/stencil2d/output --kernel_name stencil --csv_file $MACHSUITE/stencil2D/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/stencil/stencil3d/output --kernel_name stencil3d --csv_file $MACHSUITE/stencil3D/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../MachSuite/viterbi/viterbi/output --kernel_name viterbi --csv_file $MACHSUITE/viterbi/xczu9eg-ffvb1156-2-i/post_hls_info.csv

ROSETTA="/home/projects/ljohn/simplescalar/zhigang/fpga_ml_dataset/fpga_ml_dataset/HLS_dataset/rosetta/"
python3 hls_feature_extract.py --prj_dir ../../../../rosetta/3d-rendering/src/sdsoc/output --kernel_name rendering --csv_file $ROSETTA/3d-rendering/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../rosetta/digit-recognition/src/sdsoc/output --kernel_name DigitRec --csv_file $ROSETTA/digit-recognition/xczu9eg-ffvb1156-2-i/post_hls_info.csv
#python3 hls_feature_extract.py --prj_dir ../../../../rosetta/face-detection/src/sdsoc/output --kernel_name face_detect --csv_file $ROSETTA/face-detection/xczu9eg-ffvb1156-2-i/post_hls_info.csv
#python3 hls_feature_extract.py --prj_dir ../../../../rosetta/optical-flow/src/sdsoc/output --kernel_name optical_flow --csv_file $ROSETTA/optical-flow/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../rosetta/spam-filter/src/sdsoc/output --kernel_name SgdLR --csv_file $ROSETTA/spam-filter/xczu9eg-ffvb1156-2-i/post_hls_info.csv

CHSTONE="/home/projects/ljohn/simplescalar/zhigang/fpga_ml_dataset/fpga_ml_dataset/HLS_dataset/chstone/"
python3 hls_feature_extract.py --prj_dir ../../../../CHStone/sha/output --kernel_name sha_stream --csv_file $CHSTONE/sha/xczu9eg-ffvb1156-2-i/post_hls_info.csv
python3 hls_feature_extract.py --prj_dir ../../../../CHStone/gsm/output --kernel_name Gsm_LPC_Analysis --csv_file $CHSTONE/gsm/xczu9eg-ffvb1156-2-i/post_hls_info.csv