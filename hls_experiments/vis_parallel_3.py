import json
import re
from pathlib import Path
from pprint import pp

import matplotlib as mpl
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.axes import Axes
from matplotlib.patches import Patch, Rectangle

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)


WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_parallel_test_run")

datasets = list(WORK_DIR.glob("*__post_frontend"))
print(datasets)

design_data = []
for dataset in datasets:
    for design_fp in dataset.glob("*"):
        design_data.append(
            {
                "design_id": design_fp.name,
                "design_dir": design_fp,
            }
        )

df_data = []
for deisgn_data_single in design_data:
    design_id = deisgn_data_single["design_id"]
    design_dir = deisgn_data_single["design_dir"]
    dataset_name = design_dir.parent.name.split("__")[0]
    parallel_type = design_dir.parent.name.split("__")[1]
    # print(f"Processing {dataset_name}")

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
        data_execution_time = json.loads(data_execution_time_fp.read_text())
        data_timeout = {"timeout": True}
    else:
        data_hls = json.loads(data_hls_fp.read_text())
        data_design = json.loads(data_design_fp.read_text())
        data_execution_time = json.loads(data_execution_time_fp.read_text())
        data_timeout = {"timeout": False}

    data_vitis_hls_execution_time = data_execution_time["VitisHLSSynthFlow"]

    ratio_data = {
        "design_id": design_id,
        "dataset_name": dataset_name,
        "parallel_type": parallel_type,
        **data_design,
        **data_hls,
        **data_vitis_hls_execution_time,
        **data_timeout,
    }
    df_data.append(ratio_data)

df = pd.DataFrame(df_data)
print(df.head())
df.to_csv(DATA_DIR / "parallel_data_from_parallel_run.csv", index=False)

df_naive = df[df["parallel_type"] == "naive"]
df_fine = df[df["parallel_type"] == "fine_grained"]


def zero_adjust(df):
    df_new = df.copy()
    t_start_min = df_new["t_start"].min()
    df_new["t_start"] = df_new["t_start"] - t_start_min
    df_new["t_end"] = df_new["t_end"] - t_start_min
    return df_new


df_naive_adjusted = zero_adjust(df_naive)
df_fine_adjusted = zero_adjust(df_fine)

max_time_naive = df_naive_adjusted["t_end"].max()
max_time_fine = df_fine_adjusted["t_end"].max()
max_time = max(max_time_naive, max_time_fine)

speedup_ratio = max_time_naive / max_time_fine
speedup_percent = (max_time_naive - max_time_fine) / max_time_naive * 100
print(f"Fine-Grained Speedup Ratio: {speedup_ratio:.2f}x")
print(f"Fine-Grained Speedup Percent: {speedup_percent:.2f}%")

CORES_ALL = list(range(32))

# COLORS_DATASET = {
#     "machsuite_xilinx": "#48cae4",
#     "polybench_xilinx": "#e63946",
#     "chstone_xilinx": "#90be6d",
# }

COLORS_DATASET = {
    "machsuite_xilinx": "#f6bd60",
    "polybench_xilinx": "#00b4d8",
    "chstone_xilinx": "#d62828",
}


def plot_left_and_right_borders(bar, ax, color):
    rect = bar.patches[0]
    rect_xy = rect.get_xy()
    rect_width = rect.get_width()
    rect_height = rect.get_height()

    left_side_points = [
        rect_xy,
        [rect_xy[0], rect_xy[1] + rect_height],
    ]
    right_side_points = [
        [rect_xy[0] + rect_width, rect_xy[1]],
        [rect_xy[0] + rect_width, rect_xy[1] + rect_height],
    ]
    ax.plot(
        *zip(*left_side_points),
        color=color,
        linewidth=0.5,
    )
    ax.plot(
        *zip(*right_side_points),
        color=color,
        linewidth=0.5,
    )


def build_timeline_plot(
    df,
    ax: Axes,
    adjust_zero=False,
    t_max_x_axis: int | None = None,
    cores: list[int] | None = None,
    draw_dataset_lines: bool = False,
    draw_last_line: bool = False,
):
    df_plot = df.copy()
    if adjust_zero:
        df_plot["t_start"] = df_plot["t_start"] - df_plot["t_start"].min()
        df_plot["t_end"] = df_plot["t_end"] - df_plot["t_start"].min()

    df_plot = df_plot.sort_values("t_start")

    for i, row in df_plot.iterrows():
        core = row["core"]
        t_start = row["t_start"]
        dt = row["dt"]
        timeout = row["timeout"]
        dataset_name = row["dataset_name"]

        if timeout:
            bar = ax.barh(
                y=core,
                left=t_start,
                width=dt,
                color="gray",
                alpha=0.3,
                # hatch="/\\",
                label=f"{dataset_name}_timeout",
                zorder=1,
            )

            plot_left_and_right_borders(bar, ax, "black")

        else:
            bar = ax.barh(
                y=core,
                left=t_start,
                width=dt,
                color=COLORS_DATASET[dataset_name],
                alpha=1.0,
                label=dataset_name,
            )

            plot_left_and_right_borders(bar, ax, "black")

    if draw_dataset_lines:
        datasets = df_plot["dataset_name"].unique()
        for dataset_name in datasets:
            df_dataset = df_plot[df_plot["dataset_name"] == dataset_name]
            t_start = df_dataset["t_end"].max()
            ax.axvline(t_start, color=COLORS_DATASET[dataset_name], linestyle="--")

    if draw_last_line:
        ax.axvline(df_plot["t_end"].max(), color="black", linestyle="--")

    if t_max_x_axis is not None:
        ax.set_xlim(0, t_max_x_axis)

    if cores is not None:
        ax.set_yticks(cores)
        # ax.set_yticklabels(map(str, cores))
        ax.set_yticklabels(
            [str(cores[0] + 1)] + [""] * (len(cores) - 2) + [str(cores[-1] + 1)]
        )

    if cores is not None:
        ax.set_ylim(-1, max(cores) + 1)

    # make the y tick label font size smaller
    for tick in ax.yaxis.get_major_ticks():
        tick.label1.set_fontsize(10)

    ax.set_xlabel("Time (s)")
    ax.set_ylabel("CPU Cores")
    # ax.set_title("Execution Timeline")


# make font size bigfger
mpl.rcParams.update({"font.size": 12})
fig, axs = plt.subplots(
    2,
    1,
    figsize=(7, 6),
)
build_timeline_plot(
    df_naive_adjusted,
    axs[0],
    t_max_x_axis=max_time,
    cores=CORES_ALL,
    draw_dataset_lines=True,
)
axs[0].set_title("Naive Parallelism")
build_timeline_plot(
    df_fine_adjusted,
    axs[1],
    t_max_x_axis=max_time,
    cores=CORES_ALL,
    draw_last_line=True,
)
axs[1].set_title(f"Fine-Grained Parallelism: {speedup_percent:.2f}% Runtime Speedup")

for ax in axs:
    ax.yaxis.set_label_coords(-0.02, 0.5)

legend_labels = {
    "machsuite_xilinx": "MachSuite",
    "polybench_xilinx": "PolyBench",
    "chstone_xilinx": "CHStone",
}

leg_artists = [
    Patch(facecolor=color, label=legend_labels[label])
    for label, color in COLORS_DATASET.items()
] + [
    Patch(
        facecolor="gray",
        edgecolor="black",
        alpha=0.3,
        label="HLS Synthesis Timed Out",
    )
]


fig.legend(
    handles=leg_artists,
    loc="lower center",
    bbox_to_anchor=(0.5, 0.01),
    ncol=4,
    borderaxespad=0.0,
    frameon=True,
    columnspacing=0.5,
)

# fig.suptitle("HLS Synthesis Execution Parallelism", fontsize=16)

fig.tight_layout()
fig.subplots_adjust(bottom=0.15)
fig.savefig(FIGURES_DIR / "timeline_plot_v3.png", dpi=300)


# def lpt_scheduling(df, n_cores):
#     df_scheduling = df.copy()

#     # drop t_start and t_end columns
#     df_scheduling = df_scheduling.drop(columns=["t_start", "t_end", "core"])
#     # sort by dt in descending order
#     df_scheduling = df_scheduling.sort_values("dt", ascending=False)

#     solution = {i: [] for i in range(n_cores)}

#     for i, row in df_scheduling.iterrows():
#         row_dict = row.to_dict()
#         total_runtimes = {
#             core: sum(data["dt"] for data in solution[core]) for core in solution
#         }
#         core = min(solution, key=lambda core: total_runtimes[core])
#         solution[core].append(row_dict)

#     for core in solution:
#         t_start = 0
#         for design in solution[core]:
#             design["t_start"] = t_start
#             design["t_end"] = t_start + design["dt"]
#             t_start = design["t_end"]

#         for design in solution[core]:
#             design["core"] = core

#     data_flat = [data for core in solution.values() for data in core]
#     df_solution = pd.DataFrame(data_flat)
#     return df_solution


# df_sch = lpt_scheduling(df_naive_adjusted, 32)
# max_time_sch = df_sch["t_end"].max()
# sch_speedup_ratio = max_time_naive / max_time_sch
# sch_speedup_percent = (max_time_naive - max_time_sch) / max_time_naive * 100

# print(f"LPT Speedup Ratio: {sch_speedup_ratio:.2f}x")
# print(f"LPT Speedup Percent: {sch_speedup_percent:.2f}%")

# fig, ax = plt.subplots(figsize=(10, 5))
# build_timeline_plot(
#     df_sch,
#     ax,
#     adjust_zero=True,
#     t_max_x_axis=max_time,
#     cores=CORES_ALL,
#     draw_dataset_lines=False,
#     draw_last_line=True,
# )
# ax.set_title(
#     f"LPT Scheduling for Naive Parallelism: {sch_speedup_percent:.2f}% Speedup"
# )
# plt.tight_layout()
# fig.savefig(FIGURES_DIR / "scheduling.png", dpi=300)
