import json
import re
import subprocess
import time
import xml.etree.ElementTree as ET
from dataclasses import dataclass, is_dataclass
from pathlib import Path

import yaml

# from framework import ConcreteDesign, ToolFlow
from hls_build_framework.framework import Design, ToolFlow

# from utils import call_tool, find_bin_path
from hls_build_framework.utils import (
    CallToolResult,
    call_tool,
    find_bin_path,
    log_execution_time_to_file,
    terminate_process_and_children,
    wait_for_files_creation,
)


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

        summary_of_timing_analysis = performance_estimates.find(  # type: ignore
            "SummaryOfTimingAnalysis"
        )
        clock_units = str(summary_of_timing_analysis.find("unit").text)  # type: ignore
        clock_period = float(
            summary_of_timing_analysis.find("EstimatedClockPeriod").text  # type: ignore
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

        summary_of_overall_latency = performance_estimates.find(  # type: ignore
            "SummaryOfOverallLatency"
        )
        latency_data = {}
        # fmt: off
        best_case_latency = summary_of_overall_latency.find("Best-caseLatency").text # type: ignore
        try:
            latency_data["best_case_latency"] = int(best_case_latency) # type: ignore
        except ValueError:
            latency_data["best_case_latency"] = None
        average_case_latency = summary_of_overall_latency.find("Average-caseLatency").text # type: ignore
        try:
            latency_data["average_case_latency"] = int(average_case_latency) # type: ignore
        except ValueError:
            latency_data["average_case_latency"] = None
        worst_case_latency = summary_of_overall_latency.find("Worst-caseLatency").text # type: ignore
        try:
            latency_data["worst_case_latency"] = int(worst_case_latency) # type: ignore
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
        resource_data["used_abs"]["BRAM_18K"] = int( area_estimates.find("Resources").find("BRAM_18K").text ) # type: ignore
        resource_data["used_abs"]["DSP"] = int(area_estimates.find("Resources").find("DSP").text) # type: ignore
        resource_data["used_abs"]["FF"] = int(area_estimates.find("Resources").find("FF").text) # type: ignore
        resource_data["used_abs"]["LUT"] = int(area_estimates.find("Resources").find("LUT").text) # type: ignore
        resource_data["used_abs"]["URAM"] = int( area_estimates.find("Resources").find("URAM").text ) # type: ignore
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
class VitisHLSDesign:
    name: str
    part: str
    target_clock_period: float
    version_vitis_hls: None | str
    version_vivado: None | str

    @classmethod
    def parse_from_synth_report_file(cls, fp: Path) -> "VitisHLSDesign":
        tree = ET.parse(fp)
        root = tree.getroot()
        vitis_hls_version = root.find("ReportVersion").find("Version").text  # type: ignore
        user_assignments = root.find("UserAssignments")  # type: ignore
        part = user_assignments.find("Part").text  # type: ignore
        target_clock_period = float(user_assignments.find("TargetClockPeriod").text)  # type: ignore
        name = root.find("RTLDesignHierarchy").find("TopModule").find("ModuleName").text  # type: ignore
        return cls(
            name=name,  # type: ignore
            part=part,  # type: ignore
            target_clock_period=target_clock_period,
            version_vitis_hls=vitis_hls_version,
            version_vivado=None,
        )


def auto_find_exported_ip(dir: Path) -> list[Path]:
    ip_dirs = list(dir.rglob("**/ip"))
    ip_dirs = list(filter(lambda x: x.is_dir(), ip_dirs))
    return ip_dirs


def check_build_files_exist(build_files: list[Path]):
    for fp in build_files:
        if not fp.exists():
            raise FileNotFoundError(
                f"Build file {fp} does not exist. This build file is required for the"
                " build process of all designs."
            )


def check_files_exist(files: list[Path]):
    for fp in files:
        if not fp.exists():
            raise FileNotFoundError(
                f"File {fp} does not exist. This files needed for the current flow."
            )


def warn_for_reset_flags(files: list[Path], reset_flag_str: str = "-reset"):
    for fp in files:
        raw_tcl_txt = fp.read_text()
        if reset_flag_str in raw_tcl_txt:
            print(
                f'Warning: {fp} contains the "-reset" flag {reset_flag_str}. Since "dataset_hls.tcl" is run first it will '
                f'create the project and synthesis solution. A "-reset" flag in {reset_flag_str} will overwrite the already created project or solution.'
            )


class VitisHLSSynthFlow(ToolFlow):
    name = "VitisHLSSynthFlow"

    def __init__(
        self,
        vitis_hls_bin: str | None = None,
        log_output: bool = False,
        log_execution_time: bool = True,
    ):
        if vitis_hls_bin is None:
            self.vitis_hls_bin = find_bin_path("vitis_hls")
        else:
            self.vitis_hls_bin = vitis_hls_bin

        self.log_output = log_output
        self.log_execution_time = log_execution_time

    def execute(self, design: Design, timeout: float | None = None) -> list[Design]:
        t_0 = time.perf_counter()

        design_dir = design.dir

        fp_hls_synth_tcl = design_dir / "dataset_hls.tcl"
        build_files = [fp_hls_synth_tcl]
        check_build_files_exist(build_files)

        # if timeout is not None:
        #     try:
        #         call_tool(
        #             f"{self.vitis_hls_bin} dataset_hls.tcl",
        #             cwd=design_dir,
        #             log_output=self.log_output,
        #             timeout=timeout,
        #         )
        #     except subprocess.TimeoutExpired:
        #         (design_dir / f"timeout_{self.name}.txt").touch()
        #         print(f"Timeout of {timeout} seconds reached for {design_dir}")
        #         return []
        # else:
        #     call_tool(
        #         f"{self.vitis_hls_bin} dataset_hls.tcl",
        #         cwd=design_dir,
        #         log_output=self.log_output,
        #     )

        if timeout is not None:
            return_result = call_tool(
                f"{self.vitis_hls_bin} dataset_hls.tcl",
                cwd=design_dir,
                log_output=self.log_output,
                timeout=timeout,
                raise_on_error=True,
            )
            if return_result == CallToolResult.TIMEOUT:
                (design_dir / f"timeout__{self.name}.txt").touch()
                print(f"[{design_dir}] Timeout of {timeout} seconds reached")

                t_1 = time.perf_counter()
                if self.log_execution_time:
                    log_execution_time_to_file(design_dir, self.name, t_0, t_1)

                return []
        else:
            call_tool(
                f"{self.vitis_hls_bin} dataset_hls.tcl",
                cwd=design_dir,
                log_output=self.log_output,
                raise_on_error=True,
            )

        csynth_report_fp = auto_find_synth_report(design_dir)

        hls_data = DesignHLSSynthData.parse_from_synth_report_file(csynth_report_fp)
        hls_data.to_json(design_dir / "data_hls.json")  # type: ignore

        design_data = VitisHLSDesign.parse_from_synth_report_file(csynth_report_fp)
        design_data.to_json(design_dir / "data_design.json")  # type: ignore

        t_1 = time.perf_counter()
        if self.log_execution_time:
            log_execution_time_to_file(design_dir, self.name, t_0, t_1)

        return [design]


class VitisHLSCosimSetupFlow(ToolFlow):
    name = "VitisHLSCosimSetupFlow"

    def __init__(self, vitis_hls_bin: str | None = None, log_output: bool = False):
        if vitis_hls_bin is None:
            self.vitis_hls_bin = find_bin_path("vitis_hls")
        else:
            self.vitis_hls_bin = vitis_hls_bin

        self.log_output = log_output

        self.patch_sim_fp = Path(__file__).parent / "patch_sim.sh"

    def execute(self, design: Design) -> list[Design]:
        design_dir = design.dir

        fp_hls_cosim_setup_tcl = design_dir / "dataset_hls_cosim_setup.tcl"
        build_files = [fp_hls_cosim_setup_tcl]
        check_build_files_exist(build_files)
        warn_for_reset_flags(build_files)

        call_tool(
            f"{self.vitis_hls_bin} dataset_hls_cosim_setup.tcl",
            cwd=design_dir,
            log_output=self.log_output,
        )
        cosim_dir = list(design_dir.rglob("**/sim"))[0]
        solution_dir = cosim_dir.parent
        call_tool(
            f"bash {self.patch_sim_fp}", cwd=solution_dir, log_output=self.log_output
        )

        return [design]


class VitisHLSImplFlow(ToolFlow):
    name = "VitisHLSImplFlow"

    def __init__(
        self,
        vitis_hls_bin: str | None = None,
        log_output: bool = False,
        log_execution_time: bool = True,
    ):
        if vitis_hls_bin is None:
            self.vitis_hls_bin = find_bin_path("vitis_hls")
        else:
            self.vitis_hls_bin = vitis_hls_bin

        self.log_output = log_output
        self.log_execution_time = log_execution_time

    def execute(self, design: Design, timeout: float | None = None) -> list[Design]:
        t_0 = time.perf_counter()

        design_dir = design.dir

        fp_hls_ip_export = design_dir / "dataset_hls_ip_export.tcl"
        build_files = [fp_hls_ip_export]
        check_build_files_exist(build_files)
        warn_for_reset_flags(build_files)

        # call_tool(
        #     f"{self.vitis_hls_bin} dataset_hls_ip_export.tcl",
        #     cwd=design_dir,
        #     log_output=self.log_output,
        # )

        ### Vivado impl from Vitis HLS Workaround ###

        # When running the 'export_design -flow impl ...' command from Vitis HLS, it seems to hang even when the child
        # Vivado impl process is completed and logged that it is done. However the Vitis HLS process that spawned
        # the Vivado processes still waits and does not return or exit.

        # After several hours of debugging trying to run Vivado impl from Vitis HLS, I have come to the following workaround:

        # - First we launch the 'export_design -flow impl ...' command in dataset_hls_ip_export.tcl using vitis hls
        # - While that spins in the background, we keep an eye out for autogenerated files that we need
        #   - This is a blocking operation with a timeout, it just polls for the files we are looking for
        #   - We mainly need the 'run_vivado.tcl' and 'impl.sh' files
        # - Once we see that the files we need are generated (or hit the timeout), we kill the running Vitis HLS process and its children
        # - We then launch Vivado impl ourselves using the 'impl.sh' file

        # solution_dirs = auto_find_solutions(design_dir)
        # if len(solution_dirs) == 0 or len(solution_dirs) > 1:
        #     raise ValueError(
        #         f"Expected to find exactly one solution directory in {design_dir}."
        #     )
        # solution_dir = solution_dirs[0]

        # impl_sh_fp = solution_dir / "impl" / "verilog" / "impl.sh"
        # impl_sh_dir = impl_sh_fp.parent
        # files_to_look_for = [
        #     impl_sh_fp,
        #     solution_dir / "impl" / "verilog" / "run_vivado.tcl",
        #     solution_dir / "impl" / "verilog" / "settings.tcl",
        #     solution_dir / "impl" / "verilog" / "extraction.tcl",
        # ]

        # p_fake_start = subprocess.Popen(
        #     [str(self.vitis_hls_bin), "dataset_hls_ip_export.tcl"],
        #     cwd=design_dir,
        #     text=True,
        # )
        # files_found = wait_for_files_creation(files_to_look_for, 60.0 * 5)
        # terminate_process_and_children(p_fake_start.pid)
        # p_fake_start.terminate()
        # if not files_found:
        #     raise RuntimeError(
        #         "Required files for implementation were not found in time, tool might have failed to generate them."
        #     )
        # time.sleep(1)

        # sh_bin_path = find_bin_path("sh")
        # impl_sh_command = f"{sh_bin_path} impl.sh"
        #  -mode batch -source run_vivado.tcl
        # vivado_bin_path = find_bin_path("vivado")
        # impl_vivado_command = f"{vivado_bin_path} -mode batch -source run_vivado.tcl"

        # if timeout is not None:
        #     return_result = call_tool(
        #         # f"{self.vitis_hls_bin} dataset_hls_ip_export.tcl",
        #         impl_vivado_command,
        #         cwd=impl_sh_dir,
        #         log_output=self.log_output,
        #         timeout=timeout,
        #         raise_on_error=True,
        #         shell=False,
        #     )
        #     if return_result == CallToolResult.TIMEOUT:
        #         (design_dir / f"timeout__{self.name}.txt").touch()
        #         print(f"[{design_dir}] Timeout of {timeout} seconds reached")
        #         t_1 = time.perf_counter()
        #         if self.log_execution_time:
        #             log_execution_time_to_file(design_dir, self.name, t_0, t_1)
        #         return []
        # else:
        #     call_tool(
        #         # f"{self.vitis_hls_bin} dataset_hls_ip_export.tcl",
        #         impl_vivado_command,
        #         cwd=impl_sh_dir,
        #         log_output=self.log_output,
        #         raise_on_error=True,
        #         shell=False,
        #     )

        if timeout is not None:
            return_result = call_tool(
                f"{self.vitis_hls_bin} dataset_hls_ip_export.tcl",
                cwd=design_dir,
                log_output=self.log_output,
                timeout=timeout,
                raise_on_error=True,
                shell=False,
            )
            if return_result == CallToolResult.TIMEOUT:
                (design_dir / f"timeout__{self.name}.txt").touch()
                print(f"[{design_dir}] Timeout of {timeout} seconds reached")
                t_1 = time.perf_counter()
                if self.log_execution_time:
                    log_execution_time_to_file(design_dir, self.name, t_0, t_1)
                return []
        else:
            call_tool(
                f"{self.vitis_hls_bin} dataset_hls_ip_export.tcl",
                cwd=design_dir,
                log_output=self.log_output,
                raise_on_error=True,
                shell=False,
            )

        t_1 = time.perf_counter()
        if self.log_execution_time:
            log_execution_time_to_file(design_dir, self.name, t_0, t_1)

        return [design]


class VitisHLSImplReportFlow(ToolFlow):
    name = "VitisHLSImplReportFlow"

    def __init__(
        self,
        vitis_hls_bin: str | None = None,
        vivado_bin: str | None = None,
        log_output: bool = False,
        log_execution_time: bool = True,
    ):
        if vitis_hls_bin is None:
            self.vitis_hls_bin = find_bin_path("vitis_hls")
        else:
            self.vitis_hls_bin = vitis_hls_bin

        if vivado_bin is None:
            self.vivado_bin = find_bin_path("vivado")
        else:
            self.vivado_bin = vivado_bin

        self.log_output = log_output
        self.log_execution_time = log_execution_time

    def execute(self, design: Design, timeout: float | None) -> list[Design]:
        t_0 = time.perf_counter()

        design_dir = design.dir

        vivado_xpr_file_results = list(design_dir.rglob("**/*.xpr"))
        if len(vivado_xpr_file_results) == 0:
            raise FileNotFoundError(f"No vivado project file found in {design_dir}")
        vivado_xpr_file = vivado_xpr_file_results[0]

        tcl_run_vivado_reporting_fp = design_dir / "run_vivado_reporting.tcl"

        s = ""
        s += f"open_project {vivado_xpr_file}\n"
        s += "open_run impl_1\n"
        s += "set_units -power mW\n"
        s += "report_power -hier all -file power.rpt\n"
        s += "report_utilization -hierarchical -file utilization.rpt\n"
        s += "report_timing -file slack.rpt -sort_by slack\n"
        s += "report_timing_summary -setup -hold -file timing.rpt\n"
        s += "close_design\n"
        s += "close_project\n"

        tcl_run_vivado_reporting_fp.write_text(s)

        call_tool(
            f"{self.vivado_bin} -mode batch -source run_vivado_reporting.tcl",
            cwd=design_dir,
        )

        # check that the report files exist
        power_report_fp = design_dir / "power.rpt"
        utilization_report_fp = design_dir / "utilization.rpt"
        timing_report_fp = design_dir / "timing.rpt"

        check_files_exist([power_report_fp, utilization_report_fp, timing_report_fp])

        data = VitisHLSImplReportFlow.parse_all_reports(design_dir)
        data_fp = design_dir / "data_implementation.json"
        data_fp.write_text(json.dumps(data, indent=4))

        t_1 = time.perf_counter()
        if self.log_execution_time:
            log_execution_time_to_file(design_dir, self.name, t_0, t_1)

        return [design]

    @staticmethod
    def parse_all_reports(design_dir: Path) -> dict[str, dict]:
        power_report = VitisHLSImplReportFlow.parse_power_report(design_dir)
        utilization_report = VitisHLSImplReportFlow.parse_utilization_report(design_dir)
        timing_report = VitisHLSImplReportFlow.parse_timing_report(design_dir)

        data = {}
        for k, v in power_report.items():
            data[f"power__{k}"] = v
        for k, v in utilization_report.items():
            data[f"utilization__{k}"] = v
        for k, v in timing_report.items():
            data[f"timing__{k}"] = v

        return data

    @staticmethod
    def parse_power_report(design_dir: Path) -> dict:
        report_fp = design_dir / "power.rpt"
        check_files_exist([report_fp])

        data = {}
        # data["units"] = "mW"

        report_raw = report_fp.read_text()

        report_raw = report_fp.read_text()
        lines = report_raw.splitlines()

        # | Total On-Chip Power (mW) | xxx.xx    |

        total_power_line = list(
            filter(lambda x: "Total On-Chip Power (mW)" in x, lines)
        )[0]
        total_power = float(total_power_line.split("|")[2].strip())
        data["total_power"] = total_power

        # | Dynamic (mW)             | x.xxx        |
        # | Device Static (mW)       | xxxx.xxx     |

        dynamic_power_line = list(filter(lambda x: "Dynamic (mW)" in x, lines))[0]
        dynamic_power = float(dynamic_power_line.split("|")[2].strip())
        data["dynamic_power"] = dynamic_power

        static_power_line = list(filter(lambda x: "Device Static (mW)" in x, lines))[0]
        static_power = float(static_power_line.split("|")[2].strip())
        data["static_power"] = static_power

        return data

    @staticmethod
    def parse_utilization_report(design_dir: Path) -> dict:
        report_fp = design_dir / "utilization.rpt"
        check_files_exist([report_fp])

        report_raw = report_fp.read_text()
        lines = report_raw.splitlines()

        cols_to_search = [
            "Instance",
            "Module",
            "Total LUTs",
            "Logic LUTs",
            "LUTRAMs",
            "SRLs",
            "FFs",
            "RAMB36",
            "RAMB18",
            "URAM",
            "DSP Blocks",
        ]

        numeric_cols = [
            "Total LUTs",
            "Logic LUTs",
            "LUTRAMs",
            "SRLs",
            "FFs",
            "RAMB36",
            "RAMB18",
            "URAM",
            "DSP Blocks",
        ]

        line_idx = None
        for idx, line in enumerate(lines):
            if all([x in line for x in cols_to_search]):
                line_idx = idx
                break

        if line_idx is None:
            raise ValueError("Could not find the line containing all the search terms")

        line_to_parse_data = lines[line_idx + 2]
        line_list = line_to_parse_data.split("|")
        line_list = [s.strip() for s in line_list]
        line_list = [x for x in line_list if x]
        line_list_numeric = line_list[2:]
        line_list_numeric = map(int, line_list_numeric)

        data = {k: v for k, v in zip(numeric_cols, line_list_numeric)}

        return data

    @staticmethod
    def parse_timing_report(design_dir: Path) -> dict[str, float | int | str]:
        report_fp = design_dir / "timing.rpt"
        check_files_exist([report_fp])
        data = {}

        report_raw = report_fp.read_text()
        lines = report_raw.splitlines()

        timing_summary_cols = [
            "WNS(ns)",
            "TNS(ns)",
            "TNS Failing Endpoints",
            "TNS Total Endpoints",
            "WHS(ns)",
            "THS(ns)",
            "THS Failing Endpoints",
            "THS Total Endpoints",
            "WPWS(ns)",
            "TPWS(ns)",
            "TPWS Failing Endpoints",
            "TPWS Total Endpoints",
        ]

        cols_to_keep = [0, 1, 4, 5, 8, 9]
        cols_to_keep_names = [
            "WNS",
            "TNS",
            "WHS",
            "THS",
            "WPWS",
            "TPWS",
        ]

        timing_summary_cols_line_num = None
        for idx, line in enumerate(lines):
            if all([x in line for x in timing_summary_cols]):
                timing_summary_cols_line_num = idx
                break

        if timing_summary_cols_line_num is None:
            raise ValueError("Could not find the line containing all the search terms")

        timing_summary_data_line = lines[timing_summary_cols_line_num + 2]
        timing_summary_data_line_list = timing_summary_data_line.split()
        timing_summary_data_line_list = [
            s.strip() for s in timing_summary_data_line_list
        ]
        timing_summary_data_line_list = [x for x in timing_summary_data_line_list if x]
        timing_summary_data_line_list = list(map(float, timing_summary_data_line_list))

        data_timing_summary = {}
        for idx, col_name in zip(cols_to_keep, cols_to_keep_names):
            data_timing_summary[col_name] = timing_summary_data_line_list[idx]
        data_timing_summary = {k.lower(): v for k, v in data_timing_summary.items()}

        clock_cols = [
            "Clock",
            "Waveform(ns)",
            "Period(ns)",
            "Frequency(MHz)",
        ]

        clock_cols_line_num = None
        for idx, line in enumerate(lines):
            if all([x in line for x in clock_cols]):
                clock_cols_line_num = idx
                break

        if clock_cols_line_num is None:
            raise ValueError("Could not find the line containing all the search terms")

        clock_data_line = lines[clock_cols_line_num + 2]
        clock_data_line_list = re.split(r"\s{2,}", clock_data_line)
        clock_data_line_list = [s.strip() for s in clock_data_line_list]
        clock_data_line_list = [x for x in clock_data_line_list if x]
        clock_data_line_list[2] = float(clock_data_line_list[2])
        clock_data_line_list[3] = float(clock_data_line_list[3])

        data_clock = {
            "clock_period": clock_data_line_list[2],
            "clock_frequency": clock_data_line_list[3],
        }

        data = {
            **data_timing_summary,
            **data_clock,
        }

        return data
