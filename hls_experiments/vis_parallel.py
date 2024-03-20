import json
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.axes import Axes

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_parallel_test_run")


runtime_data_files = sorted(list(WORK_DIR.rglob("**/execution_time_data.json")))
design_names = [f.parent.name for f in runtime_data_files]
dataset_names = [f.parent.parent.name for f in runtime_data_files]

data = []
for runtime_data_file, design_name, dataset_name in zip(
    runtime_data_files, design_names, dataset_names
):
    data_runtime = json.loads(runtime_data_file.read_text())
    data_runtime = data_runtime["OptDSLFrontend"]
    data.append(
        {"design_name": design_name, "dataset_name": dataset_name, **data_runtime}
    )

df = pd.DataFrame(data)
print(df)

df_naive = df[df["dataset_name"].str.contains("_naive")]
df_fine_grained = df[df["dataset_name"].str.contains("fine_grained")]


def start_at_zero(df):
    zero_point = df["t_start"].min()
    df["t_start"] -= zero_point
    df["t_end"] -= zero_point

    return df


df_naive = start_at_zero(df_naive)
df_fine_grained = start_at_zero(df_fine_grained)

max_time_all = max(df_naive["t_end"].max(), df_fine_grained["t_end"].max())


def total_time(df):
    return df["t_end"].max()


total_time_naive = total_time(df_naive)
total_time_fine_grained = total_time(df_fine_grained)
speedup = total_time_naive / total_time_fine_grained
speedup_percent = (1 - speedup) * 100

print(f"Total time Naive: {total_time_naive}")
print(f"Total time Fine Grained: {total_time_fine_grained}")
print(f"Speedup: {speedup:.2f}x")
print(f"Speedup percent: {speedup_percent:.2f}%")

# make a timeline plot of the folling data
#       design_name                   dataset_name       t_start         t_end        dt  core
# 0       aes_table  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.187901     2
# 1   aes_tableless  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.226579     2
# 2        backprop  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.331222     1
# 3        bfs_bulk  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.202852     1
# 4       bfs_queue  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.278006     1
# 5   fft_transpose  machsuite_xilinx_fine_grained  2.337395e+06  2.337395e+06  0.322174     3

# bars should start and end at t_start and t_end, with the width of the bar being the duration of the execution
# there are three rows for the bars in the plot, one for each core


def dataset_color(dataset_name):
    if "polybench" in dataset_name:
        return "blue"
    elif "machsuite" in dataset_name:
        return "green"
    else:
        return "black"


def build_timeline_plot(df, ax: Axes, plot_dataset_lines=False):
    for i, row in df.iterrows():
        color = dataset_color(row["dataset_name"])
        ax.barh(
            row["core"],
            row["dt"],
            left=row["t_start"],
            color=color,
            # label=f"core {row['core']}",
            edgecolor="black",
            linewidth=0.5,
        )

    if plot_dataset_lines:
        # find the last time point for each dataset (dataset_name)
        first_time = df.groupby("dataset_name")["t_start"].min()
        last_time = df.groupby("dataset_name")["t_end"].max()

        # draw a vertical line at the end of each dataset
        for dataset_name, t_end in last_time.items():
            ax.axvline(t_end, color="black", linestyle="--", linewidth=1)
            ax.text(
                t_end,
                3,
                dataset_name,
                verticalalignment="center",
                horizontalalignment="right",
                fontsize=8,
            )

    ax.set_yticks([1, 2, 3])
    ax.set_yticklabels(["core 1", "core 2", "core 3"])
    ax.set_xlabel("Time (s)")
    ax.set_ylabel("Core")


fig, ax = plt.subplots(nrows=2, ncols=1)

build_timeline_plot(df_naive, ax[0], plot_dataset_lines=True)
build_timeline_plot(df_fine_grained, ax[1], plot_dataset_lines=False)

ax[0].set_title("Naive")
ax[1].set_title("Fine Grained")

ax[0].set_xlim(0, max_time_all)
ax[1].set_xlim(0, max_time_all)

fig.suptitle(
    f"Execution Time Timeline\nSpeedup: {speedup:.2f}x, {speedup_percent:.2f}%"
)


fig.tight_layout()
fig.savefig(FIGURES_DIR / "execution_time_timeline.png")
