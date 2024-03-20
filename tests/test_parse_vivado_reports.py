from pathlib import Path
from pprint import pp

from hls_build_framework.flow_vitis import VitisHLSImplReportFlow
from hls_build_framework.framework import Design

test_design_fp = Path("/usr/scratch/skaram7/hlsdataset_test_prj")
test_design = Design("test_design", test_design_fp)
flow = VitisHLSImplReportFlow()

design_dir = test_design_fp
data = flow.parse_all_reports(design_dir)
pp(data)
