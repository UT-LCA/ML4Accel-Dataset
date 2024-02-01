while getopts b:n: flag
do
  case "${flag}" in
    b) board_type=${OPTARG};;
    n) script_num=${OPTARG};;
  esac
done

python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/atax/hls/prj/ --src_dir ../../../target/atax/vivado/src/ --prj_dir ../../../target/atax/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/bicg/hls/prj/ --src_dir ../../../target/bicg/vivado/src/ --prj_dir ../../../target/bicg/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/gemm/hls/prj/ --src_dir ../../../target/gemm/vivado/src/ --prj_dir ../../../target/gemm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/gesummv/hls/prj/ --src_dir ../../../target/gesummv/vivado/src/ --prj_dir ../../../target/gesummv/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/k2mm/hls/prj/ --src_dir ../../../target/k2mm/vivado/src/ --prj_dir ../../../target/k2mm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/k3mm/hls/prj/ --src_dir ../../../target/k3mm/vivado/src/ --prj_dir ../../../target/k3mm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/mvt/hls/prj/ --src_dir ../../../target/mvt/vivado/src/ --prj_dir ../../../target/mvt/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/syr2k/hls/prj/ --src_dir ../../../target/syr2k/vivado/src/ --prj_dir ../../../target/syr2k/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/syrk/hls/prj/ --src_dir ../../../target/syrk/vivado/src/ --prj_dir ../../../target/syrk/vivado/${board_type}_prj --script_num ${script_num}

#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/atax/hls/${board_type}_prj/ --src_dir ../../../target/atax/vivado/src/ --prj_dir ../../../target/atax/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/bicg/hls/${board_type}_prj/ --src_dir ../../../target/bicg/vivado/src/ --prj_dir ../../../target/bicg/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/gemm/hls/${board_type}_prj/ --src_dir ../../../target/gemm/vivado/src/ --prj_dir ../../../target/gemm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/gesummv/hls/${board_type}_prj/ --src_dir ../../../target/gesummv/vivado/src/ --prj_dir ../../../target/gesummv/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/k2mm/hls/${board_type}_prj/ --src_dir ../../../target/k2mm/vivado/src/ --prj_dir ../../../target/k2mm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/k3mm/hls/${board_type}_prj/ --src_dir ../../../target/k3mm/vivado/src/ --prj_dir ../../../target/k3mm/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/mvt/hls/${board_type}_prj/ --src_dir ../../../target/mvt/vivado/src/ --prj_dir ../../../target/mvt/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/syr2k/hls/${board_type}_prj/ --src_dir ../../../target/syr2k/vivado/src/ --prj_dir ../../../target/syr2k/vivado/${board_type}_prj --script_num ${script_num}
#python3 auto_run.py --board_type ${board_type} --hls_dir ../../../target/syrk/hls/${board_type}_prj/ --src_dir ../../../target/syrk/vivado/src/ --prj_dir ../../../target/syrk/vivado/${board_type}_prj --script_num ${script_num}

#echo "python3 auto_run.py --hls_dir ../../../target/atax/hls/${board_type}_prj/ --src_dir ../../../target/atax/vivado/src/ --prj_dir ../../../target/atax/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/bicg/hls/${board_type}_prj/ --src_dir ../../../target/bicg/vivado/src/ --prj_dir ../../../target/bicg/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/gemm/hls/${board_type}_prj/ --src_dir ../../../target/gemm/vivado/src/ --prj_dir ../../../target/gemm/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/gesummv/hls/${board_type}_prj/ --src_dir ../../../target/gesummv/vivado/src/ --prj_dir ../../../target/gesummv/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/k2mm/hls/${board_type}_prj/ --src_dir ../../../target/k2mm/vivado/src/ --prj_dir ../../../target/k2mm/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/k3mm/hls/${board_type}_prj/ --src_dir ../../../target/k3mm/vivado/src/ --prj_dir ../../../target/k3mm/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/mvt/hls/${board_type}_prj/ --src_dir ../../../target/mvt/vivado/src/ --prj_dir ../../../target/mvt/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/syr2k/hls/${board_type}_prj/ --src_dir ../../../target/syr2k/vivado/src/ --prj_dir ../../../target/syr2k/vivado/${board_type}_prj --script_num ${script_num}"
#echo "python3 auto_run.py --hls_dir ../../../target/syrk/hls/${board_type}_prj/ --src_dir ../../../target/syrk/vivado/src/ --prj_dir ../../../target/syrk/vivado/${board_type}_prj --script_num ${script_num}"
