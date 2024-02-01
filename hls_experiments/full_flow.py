from pathlib import Path

from hls_build_framework.framework import (
    DesignDataset,
    DesignStage,
    PargmaComboFrontend,
)

DIR_DATASET_POLYBENCH_XILINX = Path()
DIR_DATASET_POLYBENCH_INTEL = Path()

DIR_DATASET_MATCHSUITE_XILINX = Path()
DIR_DATASET_MATCHSUITE_INTEL = Path()

dataset_polybench_xilinx = DesignDataset.from_dir(
    "polybench_xilinx", DIR_DATASET_POLYBENCH_XILINX, DesignStage.CONCRETE
)
dataset_polybench_intel = DesignDataset.from_dir(
    "polybench_intel", DIR_DATASET_POLYBENCH_INTEL, DesignStage.CONCRETE
)

dataset_matchsuite_xilinx = DesignDataset.from_dir(
    "matchsuite_xilinx", DIR_DATASET_MATCHSUITE_XILINX, DesignStage.CONCRETE
)
dataset_matchsuite_intel = DesignDataset.from_dir(
    "matchsuite_intel", DIR_DATASET_MATCHSUITE_INTEL, DesignStage.CONCRETE
)

datasets = {
    "polybench_xilinx": dataset_polybench_xilinx,
    "polybench_intel": dataset_polybench_intel,
    "matchsuite_xilinx": dataset_matchsuite_xilinx,
    "matchsuite_intel": dataset_matchsuite_intel,
}

frontend_pragma_combinations = PargmaComboFrontend()
