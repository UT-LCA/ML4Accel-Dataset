import enum
from abc import ABC, abstractmethod, abstractproperty
from enum import Enum
from pathlib import Path

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


def filter_files_by_ext(files: list[Path], ext: str) -> list[Path]:
    return [file for file in files if file.suffix == ext]


class DesignStage(Enum):
    ABSTRACT = enum.auto()
    CONCRETE = enum.auto()


class Design(ABC):
    @abstractproperty
    def design_stage(self) -> DesignStage:
        ...

    def __init__(self, name: str, dir: Path):
        self.name = name
        self.dir = dir

    @property
    def all_files(self) -> list[Path]:
        all_files_in_dir(self.dir)


class AbstractDesign(Design):
    design_stage = DesignStage.ABSTRACT


class ConcreteDesign(Design):
    design_stage = DesignStage.CONCRETE


class DesignDataset:
    def __init__(self, name: str, designs: list[Design]):
        self.name = name
        self.designs = designs

    @classmethod
    def from_dir(name, dir: Path, design_stage: DesignStage) -> "DesignDataset":
        designs = []
        for subdir in dir.iterdir():
            if subdir.is_dir():
                if design_stage == DesignStage.ABSTRACT:
                    designs.append(AbstractDesign(subdir.name, subdir))
                else:
                    designs.append(ConcreteDesign(subdir.name, subdir))
        return DesignDataset(name, designs)


class Frontend(ABC):
    name: str

    @abstractmethod
    def execute(self, design: Design) -> list[Design]:
        ...

    def execute_multiple(self, designs: list[Design], n_jobs: int = 1) -> list[Design]:
        # TODO: parallelize with joblib
        for design in designs:
            self.execute(design)


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
    def execute(self, design: ConcreteDesign) -> list[ConcreteDesign]:
        ...

    def execute_multiple(
        self, designs: list[ConcreteDesign], n_jobs: int = 1
    ) -> list[ConcreteDesign]:
        # TODO: parallelize with joblib.
        for design in designs:
            self.execute(design)


class VitisHLSSynthFlow(ToolFlow):
    name = "VitisHLSSynthFlow"

    def execute(self, design: ConcreteDesign) -> list[ConcreteDesign]:
        ...


class VitisHLSCosimSetupFlow(ToolFlow):
    name = "VitisHLSCosimSetupFlow"

    def execute(self, design: ConcreteDesign) -> list[ConcreteDesign]:
        ...
