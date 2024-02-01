from pathlib import Path

from hls_build_framework.framework import (
    DesignDataset,
    DesignStage,
    PargmaComboFrontend,
    VitisHLSImplFlow,
    VitisHLSSynthFlow,
)

DIR_CURRENT_SCRIPT = Path(__file__).parent

DIR_DATASET_POLYBENCH_XILINX = (
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
)
# DIR_DATASET_POLYBENCH_INTEL = Path()

DIR_DATASET_MATCHSUITE_XILINX = Path(
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "matchsuite"
)
# DIR_DATASET_MATCHSUITE_INTEL = Path()

DIR_DATASET_CHSTONE_XILINX = Path(
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "chstone"
)
# DIR_DATASET_CHSTONE_INTEL = Path()

DIR_DATASET_ROSETTA_XILINX = Path(
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "rosetta"
)
# DIR_DATASET_ROSETTA_INTEL = Path()


dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx", DIR_DATASET_POLYBENCH_XILINX, DesignStage.CONCRETE
)
dataset_matchsuite_xilinx = DesignDataset.from_dir(
    "matchsuite_xilinx", DIR_DATASET_MATCHSUITE_XILINX, DesignStage.CONCRETE
)
dataset_chstone_xilinx = DesignDataset.from_dir(
    "chstone_xilinx", DIR_DATASET_CHSTONE_XILINX, DesignStage.CONCRETE
)
dataset_rosetta_xilinx = DesignDataset.from_dir(
    "rosetta_xilinx", DIR_DATASET_ROSETTA_XILINX, DesignStage.CONCRETE
)


datasets = {
    "polybench_xilinx": dataset_polybench_xilinx,
    "matchsuite_xilinx": dataset_matchsuite_xilinx,
    "chstone_xilinx": dataset_chstone_xilinx,
    "rosetta_xilinx": dataset_rosetta_xilinx,
}

frontend_pragma_combo = PargmaComboFrontend()

intermediate_datasets = {
    "polybench_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
        "polybench_xilinx_post_frontend"
    ),
    "matchsuite_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
        "matchsuite_xilinx_post_frontend"
    ),
    "chstone_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
        "chstone_xilinx_post_frontend"
    ),
    "rosetta_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
        "rosetta_xilinx_post_frontend"
    ),
}

for dataset_name, dataset in datasets.items():
    intermediate_dataset = intermediate_datasets[f"{dataset_name}_post_frontend"]
    intermediate_dataset_dir = intermediate_dataset.dir
    frontend_pragma_combo.execute_multiple(
        dataset.designs, output_dataset=intermediate_dataset
    )

toolflow_vitis_hls_synth = VitisHLSSynthFlow()
toolflow_vitis_hls_impl = VitisHLSImplFlow()

for intermediate_dataset_name, intermediate_dataset in intermediate_datasets.items():
    intermediate_dataset_dir = intermediate_dataset.dir
    toolflow_vitis_hls_synth.execute_multiple(intermediate_dataset.designs)
    toolflow_vitis_hls_impl.execute_multiple(intermediate_dataset.designs)
