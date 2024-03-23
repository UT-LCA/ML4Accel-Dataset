import json
import re
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.axes import Axes

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)


WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_regression_testing")

datasets = list(WORK_DIR.glob("*__*"))

design_data = []
for dataset in datasets:
    version = dataset.name.split("__")[1]
    for design_fp in dataset.glob("*"):
        design_data.append(
            {
                "design_id": design_fp.name,
                "design_dir": design_fp,
                "version": version,
            }
        )

df_data = []
for deisgn_data_single in design_data:
    design_id = deisgn_data_single["design_id"]
    design_dir = deisgn_data_single["design_dir"]
    vitis_version = deisgn_data_single["version"]
    dataset_name = design_dir.parent.name
    dataset_name = re.sub(r"_post_frontend_post_hls_synth.*", "", dataset_name)
    print(f"Processing {dataset_name}")

    data_design_fp = design_dir / "data_design.json"
    data_hls_fp = design_dir / "data_hls.json"
    data_execution_time_fp = design_dir / "execution_time_data.json"

    if not data_design_fp.exists() or not data_hls_fp.exists():
        # check for timeout file timeout__VitisHLSSynthFlow.txt
        timeout_file = design_dir / "timeout__VitisHLSSynthFlow.txt"
        if not timeout_file.exists():
            print(f"Design {design_id} is missing data files")
        if not data_execution_time_fp.exists():
            print(f"Design {design_id} is missing execution time file")

        data_hls = {}
        data_design = {}
        data_timeout = {"timeout": True}
    else:
        data_hls = json.loads(data_hls_fp.read_text())
        data_design = json.loads(data_design_fp.read_text())
        data_execution_time = json.loads(data_execution_time_fp.read_text())
        data_timeout = {"timeout": False}

    data_vitis_hls_execution_time = data_execution_time["VitisHLSSynthFlow"]

    ratio_data = {
        "design_id": design_id,
        "vitis_version": vitis_version,
        "dataset_name": dataset_name,
        **data_design,
        **data_hls,
        **data_vitis_hls_execution_time,
        **data_timeout,
    }
    df_data.append(ratio_data)

df = pd.DataFrame(df_data)
df.to_csv(DATA_DIR / "parallel_data_from_regression_testing.csv", index=False)

print(df)
# keep designs only from 2023.1
df = df[df["vitis_version"] == "2023_1"]

COLORS_DATASET = {
    "polybench_xilinx": "blue",
    "machsuite_xilinx": "green",
    "chstone_xilinx": "red",
}


def build_timeline_plot(df, ax: Axes):
    df = df.sort_values("t_start")

    for i, row in df.iterrows():
        core = row["core"]
        t_start = row["t_start"]
        t_end = row["t_end"]
        dt = row["dt"]
        timeout = row["timeout"]
        dataset_name = row["dataset_name"]

        # core is the bar row
        ax.barh(
            y=core,
            left=t_start,
            width=dt,
            color=COLORS_DATASET[dataset_name],
            label=dataset_name,
            alpha=0.5,
        )


fig, ax = plt.subplots()
build_timeline_plot(df, ax)

fig.savefig(FIGURES_DIR / "timeline_plot_v2.png", dpi=300)
