import shutil
from pathlib import Path

from hls_build_framework.flow_intel import IntelHLSSynthFlow, IntelQuartusImplFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend_intel import OptDSLFrontendIntel
from hls_build_framework.flow_vitis import VitisHLSImplFlow, VitisHLSSynthFlow

import pickle
import os


####### Please dont touch this file, this is used for Zhigang's personal experiment, if you want to use, make your own copy #########


DIR_CURRENT_SCRIPT = Path(__file__).parent

WORK_DIR = Path("/home/projects/ljohn/simplescalar/zhigang/ML4Accel-Dataset/Intel_HLSDataset_demo")
if WORK_DIR.exists():
    shutil.rmtree(WORK_DIR)
WORK_DIR.mkdir()

# DIR_DATASET_POLYBENCH_XILINX = (
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
# )
DIR_DATASET_POLYBENCH_INTEL = (
    DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "polybench"
)

#DIR_DATASET_MACHSUITE_INTEL = (
#     DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "machsuite"
#)

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
#dataset_polybench_intel = dataset_polybench_intel.copy_dataset(WORK_DIR)



#dataset_machsuite_intel = DesignDataset.from_dir(
#     "machsuite_intel",
#     DIR_DATASET_MACHSUITE_INTEL,
#     exclude_dir_filter=lambda dir: dir.name == "common",
# )
#dataset_machsuite_intel = dataset_machsuite_intel.copy_dataset(WORK_DIR)


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
 #    "machsuite_intel": dataset_machsuite_intel,
    # "chstone_xilinx": dataset_chstone_xilinx,
    # "rosetta_xilinx": dataset_rosetta_xilinx,
    # "simple": dataset_simple,
}

opt_dsl_frontend_intel = OptDSLFrontendIntel(
    WORK_DIR, random_sample=True, random_sample_num=1
)

designs_after_frontend = {
    dataset_name: opt_dsl_frontend_intel.execute_multiple_designs(
        dataset.designs, n_jobs=32
    )
    for dataset_name, dataset in datasets.items()
}

# my_pickle = Path('/home/projects/ljohn/simplescalar/zhigang/pickle_object/test.pickle')
# # with open(my_pickle, 'wb') as file:
# #     pickle.dump(designs_after_frontend, file)
# with open(my_pickle, 'rb') as file:
#     designs_after_frontend = pickle.load(file)

toolflow_intel_hls_synth = IntelHLSSynthFlow()
toolflow_intel_impl_synth = IntelQuartusImplFlow()

for dataset_name, design_list in designs_after_frontend.items():
    toolflow_intel_hls_synth.execute_multiple_designs(design_list)

########### This step is optional, it is only necessary if power anlaysis is needed ####################

# quartus_power_set =  Path('/home/projects/ljohn/simplescalar/zhigang/pickle_object/quartus_power_set')
# power_to_csv = Path('/home/projects/ljohn/simplescalar/zhigang/pickle_object/power_to_csv.tcl')
# for dataset_name, design_list in designs_after_frontend.items():
#     for design in design_list:
#         # os.remove(design.dir / 'quartus_power_set')
#         # os.remove(design.dir / 'power_to_csv.tcl')
#         shutil.copy(quartus_power_set, design.dir)
#         shutil.copy(power_to_csv, design.dir)

for dataset_name, design_list in designs_after_frontend.items():
    toolflow_intel_impl_synth.execute_multiple_designs(design_list)
