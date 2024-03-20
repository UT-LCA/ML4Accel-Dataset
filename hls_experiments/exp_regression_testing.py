import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSSynthFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

DIR_CURRENT_SCRIPT = Path(__file__).parent


WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_regression_testing")
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


N_RANDOM_SAMPLES = 2
RAMDOM_SAMPLE_SEED = 64
opt_dsl_frontend = OptDSLFrontend(
    WORK_DIR,
    random_sample=True,
    random_sample_num=N_RANDOM_SAMPLES,
    random_sample_seed=RAMDOM_SAMPLE_SEED,
    log_execution_time=True,
)
datasets_post_frontend = (
    opt_dsl_frontend.execute_multiple_design_datasets_fine_grained_parallel(
        datasets,
        True,
        lambda x: f"{x}_post_frontend",
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
    )
)


TIMEOUT_HLS_SYNTH = 60.0 * 4  # 4 minutes

VITIS_HLS_BINS = {
    "2021_1": "/tools/software/xilinx/Vitis_HLS/2021.1/bin/vitis_hls",
    "2023_1": "/tools/software/xilinx/Vitis_HLS/2023.1/bin/vitis_hls",
}

DATASET_VERSIONS = {
    year: {
        dataset_name: dataset.copy_and_rename(
            f"{dataset_name}_post_hls_synth__{year}", WORK_DIR
        )
        for dataset_name, dataset in datasets_post_frontend.items()
    }
    for year, _ in VITIS_HLS_BINS.items()
}

for vitis_hls_version, datasets in DATASET_VERSIONS.items():
    vitis_hls_bin = VITIS_HLS_BINS[vitis_hls_version]
    toolflow_vitis_hls_synth = VitisHLSSynthFlow(vitis_hls_bin=vitis_hls_bin)
    datasets_post_hls_synth = (
        toolflow_vitis_hls_synth.execute_multiple_design_datasets_fine_grained_parallel(
            datasets,
            False,
            lambda x: f"{x}_post_hls_synth__{vitis_hls_version}",
            n_jobs=N_JOBS,
            cpu_affinity=CPU_AFFINITY,
            timeout=TIMEOUT_HLS_SYNTH,
        )
    )
