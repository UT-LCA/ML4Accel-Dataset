while getopts f: flag
do
  case "${flag}" in
    f) prj_folder=${OPTARG};;
  esac
done

DATASET=("atax" "bicg" "gemm" "gesummv" "k2mm" "k3mm" "mvt" "syr2k" "syrk")

for dataset in ${DATASET[@]};do
    echo python3 info_collect.py --prj_dir ../../../target/${dataset}/vivado/${prj_folder}/
    python3 info_collect.py --prj_dir ../../../target/${dataset}/vivado/${prj_folder}/
done;

