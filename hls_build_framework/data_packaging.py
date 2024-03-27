from abc import ABC, abstractmethod
from pathlib import Path

from hls_build_framework.flow_vitis import auto_find_solutions
from hls_build_framework.framework import Design


class DataAggregator(ABC):
    @abstractmethod
    def gather_reporting_data(self, design: Design) -> dict:
        ...

    @abstractmethod
    def gather_execution_data(self, design: Design) -> dict:
        ...

    @abstractmethod
    def gather_hls_synthesis_artifacts(self, design: Design) -> dict:
        ...

    @abstractmethod
    def gather_all_data(self, design: Design) -> dict:
        ...

    def gather_multiple_designs(self, designs: list[Design]) -> list:
        data = []
        for design in designs:
            data.append(self.gather_all_data(design))
        return data

    @abstractmethod
    def to_csv(self, data: dict, fp: Path):
        ...

    @abstractmethod
    def merge_csv(self, data: list[dict], fp: Path):
        ...

    @abstractmethod
    def to_json(self, data: dict, fp: Path):
        ...

    @abstractmethod
    def merge_json(self, data: list[dict], fp: Path):
        ...


class DataAggregatorXilinx(DataAggregator):
    def gather_reporting_data(self, design: Design) -> dict:
        ...

    def gather_execution_data(self, design: Design) -> dict:
        ...

    def gather_hls_synthesis_artifacts(self, design: Design) -> dict:
        data = {}

        solutions = auto_find_solutions(design.dir)
        if len(solutions) != 1:
            raise Exception(f"Found 0 or more than 1 solution for {design.dir}")
        solution = solutions[0]

        adb_fp = Path(solution) / ".autopilot" / "db"
        report_fp = Path(solution) / "syn" / "report"

        if not adb_fp.exists():
            raise Exception(f"Autopilot DB directory not found: {adb_fp}")
        if not report_fp.exists():
            raise Exception(f"Report directory not found: {report_fp}")

        bitcode_fp = adb_fp / "a.o.3.bc"
        if not bitcode_fp.exists():
            raise Exception(f"Bitcode file not found: {bitcode_fp}")

        # find all files that end in .adb or .adb.xml but have no other periods in the name
        adb_files = list(adb_fp.glob("*.adb"))
        adb_files = list(filter(lambda x: x.name.count(".") == 1, adb_files))
        if len(adb_files) == 0:
            raise Exception(f"No .adb files found in {adb_fp}")
        adb_xml_files = list(adb_fp.glob("*.adb.xml"))
        adb_xml_files = list(filter(lambda x: x.name.count(".") == 2, adb_xml_files))
        if len(adb_xml_files) == 0:
            raise Exception(f"No .adb.xml files found in {adb_fp}")

        report_files = list(report_fp.glob("*.xml"))
        if len(report_files) == 0:
            raise Exception(f"No report files found in {report_fp}")

        data["ir"] = [bitcode_fp]
        data["adb"] = adb_files + adb_xml_files
        data["report"] = report_files

        return data
