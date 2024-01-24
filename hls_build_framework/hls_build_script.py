import argparse
import json
import multiprocessing
import shlex
import shutil
import subprocess
import xml.etree.ElementTree as ET
from dataclasses import dataclass, is_dataclass
from pathlib import Path

import yaml


def print_xml_element(node: ET.Element):
    print("".join(node.itertext()))


def auto_find_solutions(dir: Path) -> list[Path]:
    solutions = list(dir.rglob("**/*.aps"))
    solutions = list(
        filter(
            lambda x: (
                '<AutoPilot:solution xmlns:AutoPilot="com.autoesl.autopilot.solution">'
            )
            in x.read_text(),
            solutions,
        )
    )
    if len(solutions) == 0:
        raise FileNotFoundError(f"No solution files found in {dir}")

    solution_dirs = [x.parent for x in solutions]
    for solution_dir in solution_dirs:
        if not solution_dir.is_dir():
            raise FileNotFoundError(f"Solution directory {solution_dir} does not exist")

    return solution_dirs


def auto_find_synth_report(dir: Path) -> Path:
    report_results = list(dir.rglob("**/csynth.xml"))
    if len(report_results) == 0:
        raise FileNotFoundError(f"No csynth.xml report file found in {dir}")
    if len(report_results) > 1:
        print(
            f"Found multiple csynth.xml report files in {dir}. Using the first one:"
            f" {report_results[0]}"
        )
    return report_results[0]


def auto_find_multiple_synth_report(dir: Path) -> list[Path]:
    report_results = list(dir.rglob("**/csynth.xml"))
    if len(report_results) == 0:
        raise FileNotFoundError(f"No csynth.xml report file found in {dir}")
    return report_results


def serialize_methods(cls):
    if not is_dataclass(cls):
        raise TypeError("Decorated class must be a dataclass.")

    def from_json(cls, json_path: Path):
        with json_path.open("r") as f:
            d = json.load(f)
        return cls(**d)

    def to_json(self, json_path: Path):
        with json_path.open("w") as f:
            json.dump(self.__dict__, f, indent=4)

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
    clock_period: float

    latency_best_cycles: int | None
    latency_best_seconds: float | None
    latency_average_cycles: int | None
    latency_average_seconds: float | None
    latency_worst_cycles: int | None
    latency_worst_seconds: float | None

    resources_lut_used: int
    resources_ff_used: int
    resources_dsp_used: int
    resources_bram_used: int
    resources_uram_used: int

    # resources_lut_total: int
    # resources_ff_total: int
    # resources_dsp_total: int
    # resources_bram_total: int
    # resources_uram_total: int

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

        summary_of_timing_analysis = performance_estimates.find(
            "SummaryOfTimingAnalysis"
        )
        clock_units = str(summary_of_timing_analysis.find("unit").text)
        clock_period = float(
            summary_of_timing_analysis.find("EstimatedClockPeriod").text
        )
        unit_scaler = 1
        if clock_units == "ns":
            unit_scaler = 1e-9
        elif clock_units == "us":
            unit_scaler = 1e-6
        elif clock_units == "ms":
            unit_scaler = 1e-3
        else:
            raise NotImplementedError(f"Unknown clock unit: {clock_units}")

        clock_period_t = clock_period * unit_scaler

        summary_of_overall_latency = performance_estimates.find(
            "SummaryOfOverallLatency"
        )
        latency_data = {}
        # fmt: off
        best_case_latency = summary_of_overall_latency.find("Best-caseLatency").text
        try:
            latency_data["best_case_latency"] = int(best_case_latency)
        except ValueError:
            latency_data["best_case_latency"] = None
        average_case_latency = summary_of_overall_latency.find("Average-caseLatency").text
        try:
            latency_data["average_case_latency"] = int(average_case_latency)
        except ValueError:
            latency_data["average_case_latency"] = None
        worst_case_latency = summary_of_overall_latency.find("Worst-caseLatency").text
        try:
            latency_data["worst_case_latency"] = int(worst_case_latency)
        except ValueError:
            latency_data["worst_case_latency"] = None

        if latency_data["best_case_latency"] is not None:
            latency_data["best_case_latency_t"] = latency_data["best_case_latency"] * clock_period_t
        else:
            latency_data["best_case_latency_t"] = None
        if latency_data["average_case_latency"] is not None:
            latency_data["average_case_latency_t"] = latency_data["average_case_latency"] * clock_period_t
        else:
            latency_data["average_case_latency_t"] = None
        if latency_data["worst_case_latency"] is not None:
            latency_data["worst_case_latency_t"] = latency_data["worst_case_latency"] * clock_period_t
        else:
            latency_data["worst_case_latency_t"] = None
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
        # resource_data["available_abs"] = {}
        # resource_data["available_abs"]["BRAM_18K"] = int( area_estimates.find("AvailableResources").find("BRAM_18K").text )
        # resource_data["available_abs"]["DSP"] = int( area_estimates.find("AvailableResources").find("DSP").text )
        # resource_data["available_abs"]["FF"] = int( area_estimates.find("AvailableResources").find("FF").text )
        # resource_data["available_abs"]["LUT"] = int( area_estimates.find("AvailableResources").find("LUT").text )
        # resource_data["available_abs"]["URAM"] = int( area_estimates.find("AvailableResources").find("URAM").text )
        # resource_data["used_percent"] = {}
        # resource_data["used_percent"]["BRAM_18K"] = float(resource_data["used_abs"]["BRAM_18K"] / resource_data["available_abs"]["BRAM_18K"])
        # resource_data["used_percent"]["DSP"] = float(resource_data["used_abs"]["DSP"] / resource_data["available_abs"]["DSP"])
        # resource_data["used_percent"]["FF"] = float(resource_data["used_abs"]["FF"] / resource_data["available_abs"]["FF"])
        # resource_data["used_percent"]["LUT"] = float(resource_data["used_abs"]["LUT"] / resource_data["available_abs"]["LUT"])
        # resource_data["used_percent"]["URAM"] = float(resource_data["used_abs"]["URAM"] / resource_data["available_abs"]["URAM"])
        # fmt: on

        # data = {
        #     "latency": latency_data,
        #     "resources": resource_data,
        # }

        return cls(
            clock_period=clock_period_t,
            latency_best_cycles=latency_data["best_case_latency"],
            latency_best_seconds=latency_data["best_case_latency_t"],
            latency_average_cycles=latency_data["average_case_latency"],
            latency_average_seconds=latency_data["average_case_latency_t"],
            latency_worst_cycles=latency_data["worst_case_latency"],
            latency_worst_seconds=latency_data["worst_case_latency_t"],
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

    @classmethod
    def parse_from_synth_report_file(cls, fp: Path) -> "Design":
        tree = ET.parse(fp)
        root = tree.getroot()
        vitis_hls_version = root.find("ReportVersion").find("Version").text
        user_assignments = root.find("UserAssignments")
        part = user_assignments.find("Part").text
        target_clock_period = float(user_assignments.find("TargetClockPeriod").text)
        name = root.find("RTLDesignHierarchy").find("TopModule").find("ModuleName").text
        return cls(
            name=name,
            part=part,
            target_clock_period=target_clock_period,
            version_vitis_hls=vitis_hls_version,
            version_vivado=None,
        )


def auto_find_exported_ip(dir: Path) -> list[Path]:
    ip_dirs = list(dir.rglob("**/ip"))
    ip_dirs = list(filter(lambda x: x.is_dir(), ip_dirs))
    return ip_dirs


def call_tool(cmd: str, cwd: Path, log_output: bool = True):
    cmd_list = shlex.split(cmd)
    s = subprocess.run(cmd_list, cwd=cwd, capture_output=True, text=True)
    if s.returncode != 0:
        raise RuntimeError(
            f"Command {cmd_list} failed with return code {s.returncode} and error"
            f" message:\n\n{s.stderr}\n\n{s.stdout}"
        )
    if log_output:
        print(s.stdout)


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
    # - dataset_hls.tcl
    # - dataset_impl.tcl
    # - dataset_info.tcl

    fp_hls_synth_tcl = design_dir / "dataset_hls.tcl"
    fp_hls_cosim_setup_tcl = design_dir / "dataset_hls_cosim_setup.tcl"
    fp_hls_ip_export = design_dir / "dataset_hls_ip_export.tcl"
    build_files = [fp_hls_synth_tcl, fp_hls_cosim_setup_tcl, fp_hls_ip_export]

    # check if all three files exist
    for fp in build_files:
        if not fp.exists():
            raise FileNotFoundError(
                f"Build file {fp} does not exist. This build file is required for the"
                " build process of all designs."
            )

    reset_flag_str = "-reset"
    for fp in [fp_hls_cosim_setup_tcl, fp_hls_ip_export]:
        raw_tcl_txt = fp.read_text()
        if reset_flag_str in raw_tcl_txt:
            print(
                f'Warning: {fp} contains the "-reset" flag {reset_flag_str}. Since "dataset_hls.tcl" is run first it will '
                f'create the project and synthesis solution. A "-reset" flag in {reset_flag_str} will overwrite the already created project or solution.'
            )

    # need two tools
    # - vitis_hls
    # - vivado

    # check if both tools are available in the shell
    bin_path_vitis_hls = find_bin_path("vitis_hls")
    bin_path_vivado = find_bin_path("vivado")
    patch_sim_fp = Path(__file__).parent / "patch_sim.sh"

    print(f"Found vitis_hls: {bin_path_vitis_hls}")
    print(f"Found vivado: {bin_path_vivado}")

    # Call the build flow for each design
    # - call vitis_hls on dataset_impl.tcl
    # - call vivado on synth_and_impl.tcl
    # - call vivado on dataset_info.tcl

    # csynth
    if not args.dont_csynth:
        call_tool(f"{bin_path_vitis_hls} dataset_hls.tcl", cwd=design_dir)
    csynth_report_fp = auto_find_synth_report(design_dir)

    hls_data = DesignHLSSynthData.parse_from_synth_report_file(csynth_report_fp)
    hls_data.to_json(design_dir / "data_hls.json")

    design_data = Design.parse_from_synth_report_file(csynth_report_fp)
    design_data.to_json(design_dir / "data_design.json")

    # cosim setup
    if not args.dont_cosim_setup:
        call_tool(f"{bin_path_vitis_hls} dataset_hls_cosim_setup.tcl", cwd=design_dir)
    cosim_dir = list(design_dir.rglob("**/sim"))[0]
    solution_dir = cosim_dir.parent
    call_tool(f"bash {patch_sim_fp}", cwd=solution_dir)

    # export ip and implementation
    if not args.dont_export_ip:
        call_tool(f"{bin_path_vitis_hls} dataset_hls_ip_export.tcl", cwd=design_dir)


def build_multiple_designs(design_dirs: list[Path], n_jobs: int = 1):
    # for design_dir in design_dirs:
    #     build_single_design(design_dir)
    print(design_dirs)

    num_cores = multiprocessing.cpu_count()
    if n_jobs == -1:
        n_jobs = num_cores
    elif n_jobs > num_cores or n_jobs < -1 or n_jobs == 0:
        raise ValueError(
            f"Invalid number of jobs: {n_jobs}. Number of available cores: {num_cores}"
        )

    with multiprocessing.Pool(processes=n_jobs) as pool:
        pool.map(build_single_design, design_dirs)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-j",
        "--n_jobs",
        type=int,
        default=1,
        help="Number of jobs to use for building",
    )

    parser.add_argument(
        "--dont-csynth",
        action="store_true",
        help="Don't csynth the designs.",
    )

    parser.add_argument(
        "--dont-cosim-setup",
        action="store_true",
        help="Don't setup cosim.",
    )

    parser.add_argument(
        "--dont-export-ip",
        action="store_true",
        help="Don't export the IP.",
    )

    parser.add_argument(
        "design_dirs",
        nargs="+",
        type=Path,
        help="List of design directories to build",
    )

    args = parser.parse_args()
    build_multiple_designs(args.design_dirs, args.n_jobs)
