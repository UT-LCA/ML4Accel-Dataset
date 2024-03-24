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


N_JOBS = 32
CPU_AFFINITY = list(range(N_JOBS))


HLS_DATASET_DIR = DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset"
DIR_DATASET_POLYBENCH_XILINX = HLS_DATASET_DIR / "polybench"
DIR_DATASET_MACHSUITE_XILINX = HLS_DATASET_DIR / "machsuite"
DIR_DATASET_CHSTONE_XILINX = HLS_DATASET_DIR / "chstone"


dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx",
    DIR_DATASET_POLYBENCH_XILINX,
).copy_dataset(WORK_DIR)

dataset_machsuite_xilinx = DesignDataset.from_dir(
    "machsuite_xilinx",
    DIR_DATASET_MACHSUITE_XILINX,
    exclude_dir_filter=lambda dir: dir.name == "common",
).copy_dataset(WORK_DIR)

dataset_chstone_xilinx = DesignDataset.from_dir(
    "chstone_xilinx",
    DIR_DATASET_CHSTONE_XILINX,
).copy_dataset(WORK_DIR)


datasets = {
    "polybench_xilinx": dataset_polybench_xilinx,
    "machsuite_xilinx": dataset_machsuite_xilinx,
    "chstone_xilinx": dataset_chstone_xilinx,
}

datasets_expanded = {
    **{
        f"{name}__naive": dataset.copy_and_rename(f"{name}__naive", WORK_DIR)
        for name, dataset in datasets.items()
    },
    **{
        f"{name}__fine_grained": dataset.copy_and_rename(
            f"{name}__fine_grained", WORK_DIR
        )
        for name, dataset in datasets.items()
    },
}

datasets_naive = {
    name: dataset for name, dataset in datasets_expanded.items() if "__naive" in name
}

datasets_fine = {
    name: dataset for name, dataset in datasets_expanded.items() if "__fine" in name
}


N_RANDOM_SAMPLES = 8
RAMDOM_SAMPLE_SEED = 64
opt_dsl_frontend = OptDSLFrontend(
    WORK_DIR,
    random_sample=True,
    random_sample_num=N_RANDOM_SAMPLES,
    random_sample_seed=RAMDOM_SAMPLE_SEED,
    log_execution_time=True,
)

datasets_naive_post_frontend = (
    opt_dsl_frontend.execute_multiple_design_datasets_naive_parallel(
        datasets_naive,
        True,
        lambda x: f"{x}__post_frontend",
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
    )
)

datasets_fine_post_frontend = (
    opt_dsl_frontend.execute_multiple_design_datasets_fine_grained_parallel(
        datasets_fine,
        True,
        lambda x: f"{x}__post_frontend",
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
    )
)


TIMEOUT_HLS_SYNTH = 60.0 * 5  # 5 minutes


VIVADO_PATH = Path("/tools/software/xilinx/Vivado/2023.1")
VITIS_HLS_PATH = Path("/tools/software/xilinx/Vitis_HLS/2023.1")
VITIS_HLS_BIN = VITIS_HLS_PATH / "bin" / "vitis_hls"


toolflow_vitis_hls_synth = VitisHLSSynthFlow(
    vitis_hls_bin=str(VITIS_HLS_BIN),
    env_var_xilinx_hls=str(VITIS_HLS_PATH),
    env_var_xilinx_vivado=str(VIVADO_PATH),
)

datasets_naive_post_hls_synth = (
    toolflow_vitis_hls_synth.execute_multiple_design_datasets_naive_parallel(
        datasets_naive_post_frontend,
        False,
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
        timeout=TIMEOUT_HLS_SYNTH,
    )
)

datasets_fine_post_hls_synth = (
    toolflow_vitis_hls_synth.execute_multiple_design_datasets_fine_grained_parallel(
        datasets_fine_post_frontend,
        False,
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
        timeout=TIMEOUT_HLS_SYNTH,
    )
)
