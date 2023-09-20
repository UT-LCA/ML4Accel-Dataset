import shlex
import shutil
import subprocess
from pathlib import Path
import argparse
from dataclasses import dataclass, is_dataclass
import json
import yaml
import xml.etree.ElementTree as ET


def serialize_methods(cls):
    if not is_dataclass(cls):
        raise TypeError("Decorated class must be a dataclass.")

    def from_json(cls, json_path: Path):
        with json_path.open("r") as f:
            d = json.load(f)
        return cls(**d)

    def to_json(self, json_path: Path):
        with json_path.open("w") as f:
            json.dump(self.__dict__, f)

    def from_yaml(cls, yaml_path: Path):
        with yaml_path.open("r") as f:
            d = yaml.safe_load(f)
        return cls(**d)

    def to_yaml(self, yaml_path: Path):
        with yaml_path.open("w") as f:
            yaml.safe_dump(self.__dict__, f)

    setattr(cls, "from_json", classmethod(from_json))
    setattr(cls, "to_json", to_json)
    setattr(cls, "from_yaml", classmethod(from_yaml))
    setattr(cls, "to_yaml", to_yaml)
    return cls


@serialize_methods
@dataclass
class DesignHLSSynthData:
    # clock_period: float
    latency_cycles: int
    latency_seconds: float

    # resources_lut_total: int
    # resources_ff_total: int
    # resources_dsp_total: int
    # resources_bram_total: int
    # resources_uram_total: int

    resources_lut_used: int
    resources_ff_used: int
    resources_dsp_used: int
    resources_bram_used: int
    resources_uram_used: int

    # resources_lut_fraction_used: float
    # resources_ff_fraction_used: float
    # resources_dsp_fraction_used: float
    # resources_bram_fraction_used: float
    # resources_uram_fraction_used: float

    @classmethod
    def parse_from_synth_report_file(cls, fp: Path) -> "DesignHLSSynthData":
        tree = ET.parse(fp)
        root = tree.getroot()

        # Gather latency data
        performance_estimates = root.find("PerformanceEstimates")
        summary_of_overall_latency = performance_estimates.find(
            "SummaryOfOverallLatency"
        )
        latency_data = {}

        # fmt: off
        latency_data["best_case_latency"] = int(summary_of_overall_latency.find("Best-caseLatency").text)
        latency_data["average_case_latency"] = int(summary_of_overall_latency.find("Average-caseLatency").text)
        latency_data["worst_case_latency"] = int(summary_of_overall_latency.find("Worst-caseLatency").text)
        latency_data["best_case_latency_t"] = float(summary_of_overall_latency.find("Best-caseRealTimeLatency").text.split()[0])
        latency_data["average_case_latency_t"] = float(summary_of_overall_latency.find("Average-caseRealTimeLatency").text.split()[0])
        latency_data["worst_case_latency_t"] = float(summary_of_overall_latency.find("Worst-caseRealTimeLatency").text.split()[0])
        # fmt: on

        # Gather resource data
        area_estimates = root.find("AreaEstimates")
        resource_data = {}
        # fmt: off
        resource_data["used_abs"] = {}
        resource_data["used_abs"]["BRAM_18K"] = int( area_estimates.find("Resources").find("BRAM_18K").text )
        resource_data["used_abs"]["DSP"] = int(area_estimates.find("Resources").find("DSP").text)
        resource_data["used_abs"]["FF"] = int(area_estimates.find("Resources").find("FF").text)
        resource_data["used_abs"]["LUT"] = int(area_estimates.find("Resources").find("LUT").text)
        resource_data["used_abs"]["URAM"] = int( area_estimates.find("Resources").find("URAM").text )
        resource_data["available_abs"] = {}
        resource_data["available_abs"]["BRAM_18K"] = int( area_estimates.find("AvailableResources").find("BRAM_18K").text )
        resource_data["available_abs"]["DSP"] = int( area_estimates.find("AvailableResources").find("DSP").text )
        resource_data["available_abs"]["FF"] = int( area_estimates.find("AvailableResources").find("FF").text )
        resource_data["available_abs"]["LUT"] = int( area_estimates.find("AvailableResources").find("LUT").text )
        resource_data["available_abs"]["URAM"] = int( area_estimates.find("AvailableResources").find("URAM").text )
        resource_data["used_percent"] = {}
        resource_data["used_percent"]["BRAM_18K"] = float(resource_data["used_abs"]["BRAM_18K"] / resource_data["available_abs"]["BRAM_18K"])
        resource_data["used_percent"]["DSP"] = float(resource_data["used_abs"]["DSP"] / resource_data["available_abs"]["DSP"])
        resource_data["used_percent"]["FF"] = float(resource_data["used_abs"]["FF"] / resource_data["available_abs"]["FF"])
        resource_data["used_percent"]["LUT"] = float(resource_data["used_abs"]["LUT"] / resource_data["available_abs"]["LUT"])
        resource_data["used_percent"]["URAM"] = float(resource_data["used_abs"]["URAM"] / resource_data["available_abs"]["URAM"])
        # fmt: on

        data = {
            "latency": latency_data,
            "resources": resource_data,
        }

        return cls(
            latency_cycles=latency_data["average_case_latency"],
            latency_seconds=latency_data["average_case_latency_t"],
            resources_lut_used=resource_data["used_abs"]["LUT"],
            resources_ff_used=resource_data["used_abs"]["FF"],
            resources_dsp_used=resource_data["used_abs"]["DSP"],
            resources_bram_used=resource_data["used_abs"]["BRAM_18K"],
            resources_uram_used=resource_data["used_abs"]["URAM"],
        )


@serialize_methods
@dataclass
class Design:
    name: str
    part: str
    target_clock_period: float
    version_vitis_hls: None | str
    version_vivado: None | str


# make a class dectoryator to add from_json and to_json methods to a class


def call_tool(cmd: str, cwd: Path):
    cmd = shlex.split(cmd)
    s = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if s.returncode != 0:
        raise RuntimeError(
            f"Command {cmd} failed with return code {s.returncode} and error"
            f" message\n\n{s.stderr}"
        )
    return s.stdout


def find_bin_path(cmd: str):
    bin_path = shutil.which(cmd)
    if bin_path is None:
        raise RuntimeError(
            "Could not find `{cmd}` automatically (via which), please specify the `cmd`"
            " path manually."
        )
    return bin_path


def build_single_design(design_dir: Path):
    print(f"Building design {design_dir}...")

    # three files are needed
    # - hls.tcl
    # - synth_and_impl.tcl
    # - info_ext.tcl

    fp_hls_tcl = design_dir / "dataset_hls.tcl"
    fp_impl_tcl = design_dir / "dataset_impl.tcl"
    fp_info_tcl = design_dir / "dataset_info.tcl"
    build_files = [fp_hls_tcl, fp_impl_tcl, fp_info_tcl]

    # check if all three files exist
    for fp in build_files:
        if not fp.exists():
            raise FileNotFoundError(
                f"Build file {fp} does not exist. This build file is required for the"
                " build process of all designs."
            )

    # need two tools
    # - vitis_hls
    # - vivado

    # check if both tools are available in the shell

    bin_path_vitis_hls = find_bin_path("vitis_hls")
    bin_path_vivado = find_bin_path("vivado")

    # print("Found vitis_hls: ", bin_path_vitis_hls)
    print(f"Found vitis_hls: {bin_path_vitis_hls}")
    print(f"Found vivado: {bin_path_vivado}")

    # Call the build flow for each design
    # - call vitis_hls on hls.tcl
    # - call vivado on synth_and_impl.tcl
    # - call vivado on info_ext.tcl

    call_tool(f"{bin_path_vitis_hls} {fp_hls_tcl}", cwd=design_dir)
    call_tool(f"{bin_path_vivado} -mode batch -source {fp_impl_tcl}", cwd=design_dir)
    call_tool(f"{bin_path_vivado} -mode batch -source {fp_info_tcl}", cwd=design_dir)


def build_multiple_designs(design_dirs: list[Path], n_jobs: int = 1):
    for design_dir in design_dirs:
        build_single_design(design_dir)


if __name__ == "__main__":
    # build_single_design(Path("designs/1"))
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--n_jobs",
        type=int,
        default=1,
        help="Number of jobs to use for building",
    )

    parser.add_argument(
        "design_dirs",
        nargs="+",
        type=Path,
        help="List of design directories to build",
    )

    args = parser.parse_args()
    build_multiple_designs(args.design_dirs, args.n_jobs)
