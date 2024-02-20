from framework import ConcreteDesign, ToolFlow
from utils import call_tool, find_bin_path


class IntelHLSSynthFlow(ToolFlow):
    name = "IntelHLSSynthFlow"

    def __init__(
        self,
        ipp_bin: str | None = None,
        arch: str = "Cyclone 10 GX",
        clock: str = "10ns",
        verbose: bool = True,
    ):
        if ipp_bin is None:
            self.ipp_bin = find_bin_path("i++")
        else:
            self.ipp_bin = ipp_bin

        self.arch = arch
        self.clock = clock
        self.verbose = verbose

    def execute(self, design: ConcreteDesign) -> list[ConcreteDesign]:
        design_dir = design.dir
        design_name = design.name

        # i++ -march="Cyclone 10 GX" -ghdl --clock 10ns --component $benchmark $design.c --simulator "none" -v -o $design

        cmd = ""
        cmd += f"{self.ipp_bin} "
        cmd += f"-march={self.arch} "
        cmd += "-ghdl "
        cmd += f"--clock {self.clock} "
        cmd += f"--component {design_name} "
        cmd += f"{design_dir / f'{design_name}.c'} "
        cmd += '--simulator "none" '
        cmd += "-v "
        cmd += f"-o {design_name} "

        call_tool(cmd, design_dir)


class IntelQuartusImplFlow(ToolFlow):
    name = "IntelQuartusImplFlow"

    def __init__(self, quartus_bin: str | None = None, verbose: bool = True):
        if quartus_bin is None:
            self.quartus_bin = find_bin_path("quartus_sh")
        else:
            self.quartus_bin = quartus_bin

        self.verbose = verbose

    def execute(self, design: ConcreteDesign) -> list[ConcreteDesign]:
        design_dir = design.dir
        design_name = design.name

        cwd = design_dir / f"{design_name}.prj"
        cmd = f"{self.quartus_bin} --flow compile {design_name}_quartus_compile"
        call_tool(cmd, cwd)
