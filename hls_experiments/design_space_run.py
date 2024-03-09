import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSSynthFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

DIR_CURRENT_SCRIPT = Path(__file__).parent

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space")
if WORK_DIR.exists():
    shutil.rmtree(WORK_DIR)
WORK_DIR.mkdir()


DIR_DATASET_POLYBENCH_XILINX = (
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
)

DIR_DATASET_MACHSUITE_XILINX = Path(
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "machsuite"
)

dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx",
    DIR_DATASET_POLYBENCH_XILINX,
).copy_dataset(WORK_DIR)

dataset_machsuite_xilinx = DesignDataset.from_dir(
    "machsuite_xilinx",
    DIR_DATASET_MACHSUITE_XILINX,
    exclude_dir_filter=lambda dir: dir.name == "common",
).copy_dataset(WORK_DIR)


datasets = {
    # "polybench_xilinx": dataset_polybench_xilinx,
    "machsuite_xilinx": dataset_machsuite_xilinx,
}

opt_dsl_frontend = OptDSLFrontend(WORK_DIR, random_sample=True, random_sample_num=1)

designs_after_frontend = {
    dataset_name: opt_dsl_frontend.execute_multiple_designs(dataset.designs, n_jobs=32)
    for dataset_name, dataset in datasets.items()
}

for dataset_name, design_list in designs_after_frontend.items():
    new_dir = WORK_DIR / f"{dataset_name}_post_frontend"
    if new_dir.exists():
        shutil.rmtree(new_dir)
    new_dir.mkdir()
    for design in design_list:
        design.move_to_new_parent_dir(new_dir)
datasets_post_frontend = {
    f"{dataset_name}_post_frontend": DesignDataset.from_dir(
        f"{dataset_name}_post_frontend", WORK_DIR / f"{dataset_name}_post_frontend"
    )
    for dataset_name in datasets.keys()
}

toolflow_vitis_hls_synth = VitisHLSSynthFlow()
for dataset_name, dataset in datasets_post_frontend.items():
    toolflow_vitis_hls_synth.execute_multiple_designs(dataset.designs, n_jobs=32)

# toolflow_vitis_hls_impl = VitisHLSImplFlow()
# for dataset_name, dataset in datasets_post_frontend.items():
#     toolflow_vitis_hls_impl.execute_multiple(dataset.designs, n_jobs=32)
