import shutil
from pathlib import Path

from hls_build_framework.framework import DesignDataset, DesignDatasetCollection

CURRENT_FP = Path(__file__).resolve()
CURRENT_DIR = CURRENT_FP.parent


HLS_DATASET_DIR = CURRENT_DIR.parent / "fpga_ml_dataset" / "HLS_dataset"
DIR_DATASET_POLYBENCH = HLS_DATASET_DIR / "polybench"
DIR_DATASET_MACHSUITE = HLS_DATASET_DIR / "machsuite"
DIR_DATASET_CHSTONE = HLS_DATASET_DIR / "chstone"


def dataset_polybench_builder(name: str, work_dir: Path) -> DesignDataset:
    new_dir = work_dir / DIR_DATASET_POLYBENCH.name
    shutil.copytree(DIR_DATASET_POLYBENCH, new_dir)
    d = DesignDataset.from_dir(name, new_dir)
    return d


def dataset_machsuite_builder(name: str, work_dir: Path) -> DesignDataset:
    new_dir = work_dir / DIR_DATASET_MACHSUITE.name
    shutil.copytree(DIR_DATASET_MACHSUITE, new_dir)
    d = DesignDataset.from_dir(
        name, new_dir, exclude_dir_filter=lambda dir: dir.name == "common"
    )
    return d


def dataset_chstone_builder(name: str, work_dir: Path) -> DesignDataset:
    new_dir = work_dir / DIR_DATASET_CHSTONE.name
    shutil.copytree(DIR_DATASET_CHSTONE, new_dir)
    d = DesignDataset.from_dir(name, new_dir)
    return d


def datasets_all_builder(work_dir: Path) -> DesignDatasetCollection:
    dataset_polybench = dataset_polybench_builder("polybench", work_dir)
    dataset_machsuite = dataset_machsuite_builder("machsuite", work_dir)
    dataset_chstone = dataset_chstone_builder("chstone", work_dir)
    datasets = {
        dataset_polybench.name: dataset_polybench,
        dataset_machsuite.name: dataset_machsuite,
        dataset_chstone.name: dataset_chstone,
    }
    return datasets
