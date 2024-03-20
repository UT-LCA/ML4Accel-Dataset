import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import (
    VitisHLSImplFlow,
    VitisHLSImplReportFlow,
    VitisHLSSynthFlow,
)
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

DIR_CURRENT_SCRIPT = Path(__file__).parent


WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space")
if WORK_DIR.exists():
    shutil.rmtree(WORK_DIR)
WORK_DIR.mkdir()


N_JOBS = 32
CPU_AFFINITY = list(range(N_JOBS))


HLS_DATASET_DIR = DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset"
DIR_DATASET_POLYBENCH_XILINX = HLS_DATASET_DIR / "polybench"
DIR_DATASET_MACHSUITE_XILINX = HLS_DATASET_DIR / "machsuite"


dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx",
    DIR_DATASET_POLYBENCH_XILINX,
).copy_dataset(WORK_DIR)

dataset_machsuite_xilinx = DesignDataset.from_dir(
    "machsuite_xilinx",
    DIR_DATASET_MACHSUITE_XILINX,
    exclude_dir_filter=lambda dir: dir.name == "common",
).copy_dataset(WORK_DIR)

# keep only first 2 designs for testing
dataset_polybench_xilinx.designs = dataset_polybench_xilinx.designs[:2]
dataset_machsuite_xilinx.designs = dataset_machsuite_xilinx.designs[:2]

datasets = {
    "polybench_xilinx": dataset_polybench_xilinx,
    "machsuite_xilinx": dataset_machsuite_xilinx,
}


N_RANDOM_SAMPLES = 1
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


TIMEOUT_HLS_SYNTH = 60.0 * 8  # 8 minutes
TIMEOUT_HLS_IMPL = 60.0 * 16  # 16 minutes


toolflow_vitis_hls_synth = VitisHLSSynthFlow(log_execution_time=True)
datasets_post_hls_synth = (
    toolflow_vitis_hls_synth.execute_multiple_design_datasets_fine_grained_parallel(
        datasets_post_frontend,
        False,
        n_jobs=N_JOBS,
        cpu_affinity=CPU_AFFINITY,
        timeout=TIMEOUT_HLS_SYNTH,
    )
)

toolflow_vitis_hls_implementation = VitisHLSImplFlow(log_execution_time=True)
datasets_post_hls_implementation = toolflow_vitis_hls_implementation.execute_multiple_design_datasets_fine_grained_parallel(
    datasets_post_hls_synth,
    False,
    n_jobs=N_JOBS,
    cpu_affinity=CPU_AFFINITY,
    timeout=TIMEOUT_HLS_IMPL,
)

toolflow_vitis_hls_impl_report = VitisHLSImplReportFlow(log_execution_time=True)
toolflow_vitis_hls_impl_report.execute_multiple_design_datasets_fine_grained_parallel(
    datasets_post_hls_implementation,
    False,
    n_jobs=N_JOBS,
    cpu_affinity=CPU_AFFINITY,
)
