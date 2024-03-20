import shutil
from pathlib import Path

from hls_build_framework.flow_vitis import VitisHLSImplFlow, VitisHLSImplReportFlow
from hls_build_framework.framework import Design

test_design_fp = Path(
    "/usr/scratch/skaram7/hlsdataset_test_prj/atax_opt_post_hls_synth_clean"
)
assert test_design_fp.exists()

test_design_copy_fp = Path("/usr/scratch/skaram7/hlsdataset_test_prj/test_design_copy")
if test_design_copy_fp.exists():
    shutil.rmtree(test_design_copy_fp)
shutil.copytree(test_design_fp, test_design_copy_fp)


test_design_copy = Design("test_design_copy", test_design_copy_fp)
flow = VitisHLSImplFlow()
flow.execute(test_design_copy)
