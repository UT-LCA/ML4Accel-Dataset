import shutil
from pathlib import Path

from hls_build_framework.datasets_builtin import HLS_DATASET_DIR
from hls_build_framework.flow_vitis import (
    VitisHLSImplFlow,
    VitisHLSImplReportFlow,
    VitisHLSSynthFlow,
)
from hls_build_framework.framework import Design


def test_xilinx_frontend(tmp_path):
    ...


def test_vitis_hls_impl_flow(tmp_path):
    ...


def test_vitis_hls_impl_report_flow(tmp_path):
    ...


def test_complete_xilinx_flow(tmp_path):
    ...


if __name__ == "__main__":
    test_design_copy_fp = Path(
        "/usr/scratch/skaram7/hlsdataset_test_prj/test_design_copy"
    )
    if test_design_copy_fp.exists():
        shutil.rmtree(test_design_copy_fp)

    print(test_design_copy_fp)

    design_dir = (
        HLS_DATASET_DIR / "vitis_examples" / "01_basic_examples_vhls_fixed_point_sqrt"
    )
    shutil.copytree(design_dir, test_design_copy_fp)

    design = Design("sqrt", test_design_copy_fp)

    VIVADO_PATH = Path("/tools/software/xilinx/Vivado/2023.1")
    VITIS_HLS_PATH = Path("/tools/software/xilinx/Vitis_HLS/2023.1")
    VIVADO_BIN = VIVADO_PATH / "bin" / "vivado"
    VITIS_HLS_BIN = VITIS_HLS_PATH / "bin" / "vitis_hls"

    toolflow_vitis_hls_synth = VitisHLSSynthFlow(
        vitis_hls_bin=str(VITIS_HLS_BIN),
        env_var_xilinx_hls=str(VITIS_HLS_PATH),
        env_var_xilinx_vivado=str(VIVADO_PATH),
    )
    toolflow_vitis_hls_implementation = VitisHLSImplFlow(
        vitis_hls_bin=str(VITIS_HLS_BIN),
        env_var_xilinx_hls=str(VITIS_HLS_PATH),
        env_var_xilinx_vivado=str(VIVADO_PATH),
    )
    toolflow_vitis_hls_impl_report = VitisHLSImplReportFlow(
        vitis_hls_bin=str(VITIS_HLS_BIN),
        vivado_bin=str(VIVADO_BIN),
        env_var_xilinx_hls=str(VITIS_HLS_PATH),
        env_var_xilinx_vivado=str(VIVADO_PATH),
    )

    toolflow_vitis_hls_synth.execute(design)
    toolflow_vitis_hls_implementation.execute(design)
