import enum
import shutil
from abc import ABC, abstractmethod
from enum import Enum
from pathlib import Path
from typing import Callable

import tqdm
from joblib import Parallel, delayed

EXTENSIONS_CPP = [".cpp", ".cc", ".hpp", ".h"]
EXTENTIONS_TCL = [".tcl"]
EXTENSIONS_PYTHON = [".py"]

NAMES_MAKEFILE = ["Makefile", "makefile"]
EXTENTIONS_MAKEFILE = [".mk"]

EXTENSIONS_JINJA = [".jinja", ".jinja2"]


def all_files_in_dir(dir: Path) -> list[Path]:
    files = []
    for file in dir.rglob("*"):
        if file.is_file():
            files.append(file)
    return files


def filter_files_by_ext(files: list[Path], ext: str) -> list[Path]:
    return [file for file in files if file.suffix == ext]


class DesignStage(Enum):
    ABSTRACT = enum.auto()
    CONCRETE = enum.auto()


class Design:
    def __init__(self, name: str, dir: Path):
        self.name = name
        self.dir = dir

    @property
    def all_files(self) -> list[Path]:
        return all_files_in_dir(self.dir)

    @property
    def tcl_files(self) -> list[Path]:
        return filter_files_by_ext(self.all_files, ".tcl")

    @property
    def cpp_source_files(self) -> list[Path]:
        source_files = []
        for ext in EXTENSIONS_CPP:
            source_files.extend(filter_files_by_ext(self.all_files, ext))
        return source_files

    def rename(self, new_name: str):
        self.dir.rename(self.dir.parent / new_name)
        self.name = new_name

    def move_to_new_parent_dir(self, new_parent_dir: Path):
        shutil.move(self.dir, new_parent_dir / self.name)

    def copy_and_rename(self, new_name: str, work_dir: Path) -> "Design":
        new_dir = work_dir / new_name
        if new_dir.exists():
            shutil.rmtree(new_dir)
        shutil.copytree(self.dir, new_dir)
        new_design = Design(new_name, new_dir)
        return new_design


class DesignDataset:
    def __init__(self, name: str, dataset_dir: Path, designs: list[Design]):
        self.name = name
        self.dataset_dir = dataset_dir
        self.designs = designs

    @classmethod
    def from_dir(
        cls,
        name: str,
        dir: Path,
        exclude_dir_filter: None | Callable[[Path], bool] = None,
    ) -> "DesignDataset":
        designs = []
        for sub_dir in dir.iterdir():
            if sub_dir.is_dir():
                if exclude_dir_filter is not None and exclude_dir_filter(sub_dir):
                    continue
                designs.append(Design(sub_dir.name, sub_dir))
        designs = sorted(designs, key=lambda design: design.name)
        return DesignDataset(name, dir, designs)

    @classmethod
    def from_empty_dir(cls, name: str, work_dir: Path) -> "DesignDataset":
        dataset_dir = work_dir / name
        if dataset_dir.exists():
            shutil.rmtree(dataset_dir)
        return DesignDataset(name, dataset_dir, [])

    def add_design(self, design: Design):
        self.designs.append(design)

    def add_designs(self, designs: list[Design]):
        self.designs.extend(designs)

    def copy_dataset(self, work_dir: Path) -> "DesignDataset":
        new_dataset = DesignDataset.from_empty_dir(self.name, work_dir)
        for design in self.designs:
            new_design = design.copy_and_rename(design.name, new_dataset.dataset_dir)
            new_dataset.add_design(new_design)
        return new_dataset


class Frontend(ABC):
    name: str

    @abstractmethod
    def execute(self, design: Design) -> list[Design]:
        ...

    def execute_multiple(self, designs: list[Design], n_jobs: int = 1) -> list[Design]:
        new_designs_lists = Parallel(n_jobs=n_jobs, backend="multiprocessing")(  # type: ignore
            delayed(self.execute)(design) for design in tqdm.tqdm(designs)
        )
        assert new_designs_lists is not None
        new_designs_lists: list[list[Design]] = list(new_designs_lists)
        new_designs = [design for sublist in new_designs_lists for design in sublist]
        return new_designs


class PargmaComboFrontend(Frontend):
    name = "PargmaComboFrontend"

    def execute(self, design: Design) -> list[Design]:
        ...


class JinjaElaborationFrontend(Frontend):
    name = "JinjaElaborationFrontend"

    def execute(self, design: Design) -> list[Design]:
        ...


class ToolFlow(ABC):
    name: str

    def __init__(self, work_dir: Path, *args, **kwargs):
        self.work_dir = work_dir

    @abstractmethod
    def execute(self, design: Design) -> list[Design]:
        ...

    def execute_multiple(
        self,
        designs: list[Design],
        n_jobs: int = 1,
    ) -> list[Design]:
        new_designs_lists = Parallel(n_jobs=n_jobs, backend="multiprocessing")(  # type: ignore
            delayed(self.execute)(design) for design in tqdm.tqdm(designs)
        )
        assert new_designs_lists is not None
        new_designs_lists: list[list[Design]] = list(new_designs_lists)
        new_designs = [design for sublist in new_designs_lists for design in sublist]
        return new_designs
