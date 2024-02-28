import enum
from abc import ABC, abstractmethod
from enum import Enum
from pathlib import Path
from tempfile import TemporaryDirectory
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


class Design(ABC):
    # @abstractproperty
    # def design_stage(self) -> DesignStage:
    #     ...
    design_stage: DesignStage

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


class AbstractDesign(Design):
    design_stage = DesignStage.ABSTRACT


class ConcreteDesign(Design):
    design_stage = DesignStage.CONCRETE


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
        design_stage_default: DesignStage = DesignStage.CONCRETE,
        exclude_dir_filter: None | Callable[[Path], bool] = None,
    ) -> "DesignDataset":
        designs = []
        for sub_dir in dir.iterdir():
            if sub_dir.is_dir():
                if exclude_dir_filter is not None and exclude_dir_filter(sub_dir):
                    continue
                match design_stage_default:
                    case DesignStage.ABSTRACT:
                        designs.append(AbstractDesign(sub_dir.name, sub_dir))
                    case DesignStage.CONCRETE:
                        designs.append(ConcreteDesign(sub_dir.name, sub_dir))
        designs = sorted(designs, key=lambda design: design.name)
        return DesignDataset(name, dir, designs)

    @classmethod
    def from_empty_temp_dir(cls, name: str) -> "DesignDataset":
        temp_dir_obj = TemporaryDirectory()
        temp_dir = Path(temp_dir_obj.name)
        return DesignDataset(name, temp_dir, [])

    def add_design(self, design: Design):
        self.designs.append(design)

    def add_designs(self, designs: list[Design]):
        self.designs.extend(designs)


class Frontend(ABC):
    name: str

    @abstractmethod
    def execute(self, design: Design) -> list[Design]:
        ...

    def execute_multiple(self, designs: list[Design], n_jobs: int = 1) -> list[Design]:
        # TODO: parallelize with joblib
        # for design in designs:
        #     self.execute(design)
        new_designs = Parallel(n_jobs=n_jobs, backend="multiprocessing")(  # type: ignore
            delayed(self.execute)(design) for design in tqdm.tqdm(designs)
        )
        assert new_designs is not None
        new_designs: list[Design] = list(new_designs)
        new_designs = list(new_designs)
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

    @abstractmethod
    def execute(self, design: Design) -> list[Design]:
        ...

    def execute_multiple(
        self,
        designs: list[Design],
        n_jobs: int = 1,
    ) -> list[Design]:
        # TODO: parallelize with joblib.
        # for design in designs:
        #     self.execute(design)
        new_designs = Parallel(n_jobs=n_jobs, backend="multiprocessing")(  # type: ignore
            delayed(self.execute)(design) for design in tqdm.tqdm(designs)
        )
        assert new_designs is not None
        new_designs: list[Design] = list(new_designs)
        new_designs = list(new_designs)
        return new_designs
