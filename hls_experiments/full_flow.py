from pathlib import Path

from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

DIR_CURRENT_SCRIPT = Path(__file__).parent

DIR_DATASET_POLYBENCH_XILINX = (
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


dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx",
    DIR_DATASET_POLYBENCH_XILINX,
)
# dataset_machsuite_xilinx = DesignDataset.from_dir(
#     "machsuite_xilinx",
#     DIR_DATASET_MACHSUITE_XILINX,
#     DesignStage.CONCRETE,
#     exclude_dir_filter=lambda dir: dir.name == "common",
# )
# dataset_chstone_xilinx = DesignDataset.from_dir(
#     "chstone_xilinx", DIR_DATASET_CHSTONE_XILINX
# )
# dataset_rosetta_xilinx = DesignDataset.from_dir(
#     "rosetta_xilinx", DIR_DATASET_ROSETTA_XILINX, DesignStage.CONCRETE
# )


datasets = {
    "polybench_xilinx": dataset_polybench_xilinx,
    # "machsuite_xilinx": dataset_machsuite_xilinx,
    # "chstone_xilinx": dataset_chstone_xilinx,
    # "rosetta_xilinx": dataset_rosetta_xilinx,
}

# frontend_pragma_combo = PargmaComboFrontend()

frontent_opt_dsl = OptDSLFrontend()

for dataset_name, dataset in datasets.items():
    frontent_opt_dsl.execute_multiple(dataset.designs[:1])

# intermediate_datasets = {
#     "polybench_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
#         "polybench_xilinx_post_frontend"
#     ),
#     "machsuite_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
#         "machsuite_xilinx_post_frontend"
#     ),
#     "chstone_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
#         "chstone_xilinx_post_frontend"
#     ),
#     "rosetta_xilinx_post_frontend": DesignDataset.from_empty_temp_dir(
#         "rosetta_xilinx_post_frontend"
#     ),
# }

# for dataset_name, dataset in datasets.items():
#     intermediate_dataset = intermediate_datasets[f"{dataset_name}_post_frontend"]
#     intermediate_dataset_dir = intermediate_dataset.dir
#     frontend_pragma_combo.execute_multiple(
#         dataset.designs, output_dataset=intermediate_dataset
#     )

# toolflow_vitis_hls_synth = VitisHLSSynthFlow()
# toolflow_vitis_hls_impl = VitisHLSImplFlow()


# for dataset_name, dataset in datasets.items():
#     toolflow_vitis_hls_synth.execute_multiple(dataset.designs, n_jobs=32)
# toolflow_vitis_hls_impl.execute_multiple(dataset.designs[:2])
