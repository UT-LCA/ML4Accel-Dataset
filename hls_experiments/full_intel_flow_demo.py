import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSImplFlow, VitisHLSSynthFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend_intel import OptDSLFrontendIntel

DIR_CURRENT_SCRIPT = Path(__file__).parent

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_intel_test_run")
if WORK_DIR.exists():
    shutil.rmtree(WORK_DIR)
WORK_DIR.mkdir()

# DIR_DATASET_POLYBENCH_XILINX = (
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
# )
DIR_DATASET_POLYBENCH_INTEL = (
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
)

# DIR_DATASET_MACHSUITE_XILINX = Path(
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "machsuite"
# )

# DIR_DATASET_CHSTONE_XILINX = Path(
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "chstone"
# )

# DIR_DATASET_ROSETTA_XILINX = Path(
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "rosetta"
# )

# DIR_DATASET_SIMPLE = (
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "simple"
# )

# dataset_polybench_xilinx = DesignDataset.from_dir(
#     "polybench_xilinx",
#     DIR_DATASET_POLYBENCH_XILINX,
# )
# dataset_polybench_xilinx = dataset_polybench_xilinx.copy_dataset(WORK_DIR)

dataset_polybench_intel = DesignDataset.from_dir(
    "polybench_intel",
    DIR_DATASET_POLYBENCH_INTEL,
)
dataset_polybench_intel = dataset_polybench_intel.copy_dataset(WORK_DIR)

# dataset_machsuite_xilinx = DesignDataset.from_dir(
#     "machsuite_xilinx",
#     DIR_DATASET_MACHSUITE_XILINX,
#     exclude_dir_filter=lambda dir: dir.name == "common",
# )
# dataset_chstone_xilinx = DesignDataset.from_dir(
#     "chstone_xilinx", DIR_DATASET_CHSTONE_XILINX
# )
# dataset_rosetta_xilinx = DesignDataset.from_dir(
#     "rosetta_xilinx", DIR_DATASET_ROSETTA_XILINX,
# )

# dataset_simple = DesignDataset.from_dir(
#     "simple",
#     DIR_DATASET_SIMPLE,
# )

# datasets = {
#     "polybench_xilinx": dataset_polybench_xilinx,
#     # "machsuite_xilinx": dataset_machsuite_xilinx,
#     # "chstone_xilinx": dataset_chstone_xilinx,
#     # "rosetta_xilinx": dataset_rosetta_xilinx,
#     # "simple": dataset_simple,
# }

datasets = {
    "polybench_intel": dataset_polybench_intel,
    # "machsuite_xilinx": dataset_machsuite_xilinx,
    # "chstone_xilinx": dataset_chstone_xilinx,
    # "rosetta_xilinx": dataset_rosetta_xilinx,
    # "simple": dataset_simple,
}

opt_dsl_frontend_intel = OptDSLFrontendIntel(
    WORK_DIR, random_sample=True, random_sample_num=10
)

designs_after_frontend = {
    dataset_name: opt_dsl_frontend_intel.execute_multiple_designs(
        dataset.designs, n_jobs=32
    )
    for dataset_name, dataset in datasets.items()
}

# for dataset_name, design_list in designs_after_frontend.items():
#     new_dir = WORK_DIR / f"{dataset_name}_post_frontend"
#     if new_dir.exists():
#         shutil.rmtree(new_dir)
#     new_dir.mkdir()
#     for design in design_list:
#         design.move_to_new_parent_dir(new_dir)
# datasets_post_frontend = {
#     f"{dataset_name}_post_frontend": DesignDataset.from_dir(
#         f"{dataset_name}_post_frontend", WORK_DIR / f"{dataset_name}_post_frontend"
#     )
#     for dataset_name in datasets.keys()
# }


# for dataset_name, dataset in datasets.items():
#     frontent_opt_dsl.execute_multiple(dataset.designs[:1])

# for dataset_name, dataset in datasets.items():
#     intermediate_dataset = intermediate_datasets[f"{dataset_name}_post_frontend"]
#     intermediate_dataset_dir = intermediate_dataset.dir
#     frontend_pragma_combo.execute_multiple(
#         dataset.designs, output_dataset=intermediate_dataset
#     )

# toolflow_vitis_hls_synth = VitisHLSSynthFlow()
# toolflow_vitis_hls_impl = VitisHLSImplFlow()

# for dataset_name, dataset in datasets_post_frontend.items():
#     toolflow_vitis_hls_synth.execute_multiple(dataset.designs, n_jobs=32)

# for dataset_name, dataset in datasets_post_frontend.items():
#     toolflow_vitis_hls_impl.execute_multiple(dataset.designs, n_jobs=32)


# for dataset_name, dataset in datasets.items():
#     # toolflow_vitis_hls_synth.execute_multiple(dataset.designs, n_jobs=32)
#     for design in dataset.designs:
#         toolflow_vitis_hls_synth.execute(design)

# for dataset_name, dataset in datasets.items():
#     toolflow_vitis_hls_impl.execute_multiple(dataset.designs, n_jobs=32)

# toolflow_vitis_hls_impl.execute_multiple(dataset.designs[:2])
