from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSImplReportFlow
from hls_build_framework.framework import DesignDataset

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space_v2")
if not WORK_DIR.exists():
    raise ValueError(f"WORK_DIR {WORK_DIR} does not exist")

N_JOBS = 48
CPU_AFFINITY = list(range(N_JOBS))

dataset_dirs = list(WORK_DIR.glob("*__post_frontend"))
dataset_names = [d.name.replace("__post_frontend", "") for d in dataset_dirs]

datasets_all = {
    name: DesignDataset.from_dir(name, dir)
    for name, dir in zip(dataset_names, dataset_dirs)
}

# if design dir contains a timeout__VitisHLSImplFlow.txt file, filter it out
datasets_post_hls_implementation = {}
for name, dataset in datasets_all.items():
    designs_to_keep = []
    for design in dataset.designs:
        if (
            not (design.dir / "timeout__VitisHLSImplFlow.txt").exists()
            and not (design.dir / "timeout__VitisHLSSynthFlow.txt").exists()
        ):
            designs_to_keep.append(design)
        else:
            print(f"Filtered out {design}")
    new_dataset = DesignDataset(name, dataset.dataset_dir, designs_to_keep)
    datasets_post_hls_implementation[name] = new_dataset

VIVADO_PATH = Path("/tools/software/xilinx/Vivado/2023.1")
VITIS_HLS_PATH = Path("/tools/software/xilinx/Vitis_HLS/2023.1")

VIVADO_BIN = VIVADO_PATH / "bin" / "vivado"
VITIS_HLS_BIN = VITIS_HLS_PATH / "bin" / "vitis_hls"

toolflow_vitis_hls_impl_report = VitisHLSImplReportFlow(
    vitis_hls_bin=str(VITIS_HLS_BIN),
    vivado_bin=str(VIVADO_BIN),
    env_var_xilinx_hls=str(VITIS_HLS_PATH),
    env_var_xilinx_vivado=str(VIVADO_PATH),
)
toolflow_vitis_hls_impl_report.execute_multiple_design_datasets_fine_grained_parallel(
    datasets_post_hls_implementation,
    False,
    n_jobs=N_JOBS,
    cpu_affinity=CPU_AFFINITY,
)
