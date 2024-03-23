import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSSynthFlow
from hls_build_framework.framework import Design, DesignDataset

DIR_CURRENT_SCRIPT = Path(__file__).parent

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_test_affinity")
if WORK_DIR.exists():
    shutil.rmtree(WORK_DIR)
WORK_DIR.mkdir()
print(f"WORK_DIR: {WORK_DIR}")

HLS_DATASET_DIR = DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset"
DIR_DATASET_VITIS_EXAMPLES = HLS_DATASET_DIR / "vitis_examples"

test_design_0_fp = Design(
    "fixed_point_sqrt",
    DIR_DATASET_VITIS_EXAMPLES / "01_basic_examples_vhls_fixed_point_sqrt",
)

test_design_1_fp = Design(
    "ap_arithmetic",
    DIR_DATASET_VITIS_EXAMPLES / "05_basic_examples_vhls_ap_arithmetic",
)

test_dataset_0 = DesignDataset.from_empty_dir("test_dataset_0", WORK_DIR)
test_dataset_0.add_design_copy(test_design_0_fp)

test_dataset_1 = DesignDataset.from_empty_dir("test_dataset_1", WORK_DIR)
test_dataset_1.add_design_copy(test_design_1_fp)

datasets = {
    "test_dataset_0": test_dataset_0,
    "test_dataset_1": test_dataset_1,
}

N_JOBS = 4
CPU_AFFINITY = list(range(N_JOBS))

vitis_hls_fp = Path("/tools/software/xilinx/Vitis_HLS/2023.1/bin/vitis_hls")
vitis_hls_synthesis_flow = VitisHLSSynthFlow(vitis_hls_bin=str(vitis_hls_fp))

vitis_hls_synthesis_flow.execute_multiple_design_datasets_fine_grained_parallel(
    datasets, False, n_jobs=N_JOBS, cpu_affinity=CPU_AFFINITY
)
