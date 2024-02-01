while getopts f: flag
do
  case "${flag}" in
    f) prj_folder=${OPTARG};;
  esac
done


python3 info_extract.py --prj_dir ../../../target/atax/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/bicg/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/gemm/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/gesummv/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/k2mm/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/k3mm/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/mvt/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/syr2k/vivado/${prj_folder}/
python3 info_extract.py --prj_dir ../../../target/syrk/vivado/${prj_folder}/
