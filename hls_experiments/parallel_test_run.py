import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSSynthFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

DIR_CURRENT_SCRIPT = Path(__file__).parent

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_parallel_test_run")
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
    "polybench_xilinx_naive": dataset_polybench_xilinx.copy_and_rename(
        "polybench_xilinx_naive", WORK_DIR
    ),
    "polybench_xilinx_fine_grained": dataset_polybench_xilinx.copy_and_rename(
        "polybench_xilinx_fine_grained", WORK_DIR
    ),
    "machsuite_xilinx_naive": dataset_machsuite_xilinx.copy_and_rename(
        "machsuite_xilinx_naive", WORK_DIR
    ),
    "machsuite_xilinx_fine_grained": dataset_machsuite_xilinx.copy_and_rename(
        "machsuite_xilinx_fine_grained", WORK_DIR
    ),
}

datasets_naive = {
    "machsuite_xilinx_naive": datasets["machsuite_xilinx_naive"],
    "polybench_xilinx_naive": datasets["polybench_xilinx_naive"],
}

datasets_fine_grained = {
    "machsuite_xilinx_fine_grained": datasets["machsuite_xilinx_fine_grained"],
    "polybench_xilinx_fine_grained": datasets["polybench_xilinx_fine_grained"],
}

opt_dsl_frontend = OptDSLFrontend(
    WORK_DIR,
    # random_sample=True,
    # random_sample_num=50,
    # random_sample_seed=64,
    log_execution_time=True,
)

opt_dsl_frontend.execute_multiple_design_datasets_naive_parallel(
    datasets_naive, True, lambda x: f"{x}_post", n_jobs=3, cpu_affinity=[1, 2, 3]
)

datasets_post_frontend = (
    opt_dsl_frontend.execute_multiple_design_datasets_fine_grained_parallel(
        datasets_fine_grained,
        True,
        lambda x: f"{x}_post",
        n_jobs=3,
        cpu_affinity=[1, 2, 3],
    )
)

# print(datasets_post_frontend["machsuite_xilinx_post_frontend"].designs)

# designs_after_frontend = {
#     dataset_name: opt_dsl_frontend.execute_multiple_designs(dataset.designs, n_jobs=32)
#     for dataset_name, dataset in datasets.items()
# }

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

# toolflow_vitis_hls_synth = VitisHLSSynthFlow(WORK_DIR)
# for dataset_name, dataset in datasets_post_frontend.items():
#     toolflow_vitis_hls_synth.execute_multiple_designs(dataset.designs, n_jobs=32)

# toolflow_vitis_hls_impl = VitisHLSImplFlow()
# for dataset_name, dataset in datasets_post_frontend.items():
#     toolflow_vitis_hls_impl.execute_multiple(dataset.designs, n_jobs=32)
