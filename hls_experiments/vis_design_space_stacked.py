import json
from itertools import cycle
from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from matplotlib.patches import Rectangle
from matplotlib.ticker import NullFormatter, ScalarFormatter
from pacmap import PaCMAP
from scipy.spatial import ConvexHull
from sklearn.compose import ColumnTransformer
from sklearn.decomposition import PCA
from sklearn.discriminant_analysis import StandardScaler
from sklearn.kernel_approximation import Nystroem
from sklearn.manifold import TSNE, Isomap
from sklearn.pipeline import Pipeline
from umap import UMAP

from hls_experiments.convex_hull_plotting import draw_rounded_hull


def build_df(design_dirs):
    all_data = []
    for design_dir in design_dirs:
        data_design_fp = design_dir / "data_design.json"
        data_hls_fp = design_dir / "data_hls.json"
        data_implementation_fp = design_dir / "data_implementation.json"
        data_execution_fp = design_dir / "execution_time_data.json"
        if (
            not data_design_fp.exists()
            or not data_hls_fp.exists()
            or not data_implementation_fp.exists()
            or not data_execution_fp.exists()
        ):
            # print(f"Skipping {design_dir}, missing files")
            continue
        data_hls = json.loads(data_hls_fp.read_text())
        data_hls = {f"hls_synth__{k}": v for k, v in data_hls.items()}
        data_design = json.loads(data_design_fp.read_text())
        data_implementation = json.loads(data_implementation_fp.read_text())
        data_implementation = {f"impl__{k}": v for k, v in data_implementation.items()}
        data_execution = json.loads(data_execution_fp.read_text())
        data_execution = {
            f"{tool}__{k}": v
            for tool, data in data_execution.items()
            for k, v in data.items()
        }
        data_execution = {f"execution__{k}": v for k, v in data_execution.items()}

        dataset_name = design_dir.parent.name.replace("__post_frontend", "")
        name_unique = design_dir.name

        # some fixes for the current datasets
        name = data_design["name"]
        if name == "bfs":
            if "bfs_bulk" in design_dir.name:
                data_design["name"] = "bfs_bulk"
            if "bfs_queue" in design_dir.name:
                data_design["name"] = "bfs_queue"
        if name == "aes256_encrypt_ecb":
            if "aes_table" in design_dir.name:
                data_design["name"] = "aes_table"
            if "aes_tableless" in design_dir.name:
                data_design["name"] = "aes_tableless"
        if name == "gemm":
            if "gemm_ncubed" in design_dir.name:
                data_design["name"] = "gemm_ncubed"

        data = {
            "name_unique": name_unique,
            "dataset_name": dataset_name,
            **data_design,
            **data_hls,
            **data_implementation,
            **data_execution,
        }
        all_data.append(data)

    df = pd.DataFrame(all_data)
    return df


DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space_v2")
WORK_DIR_POLYBENCH = WORK_DIR / "polybench_xilinx__post_frontend"
WORK_DIR_MACHSUITE = WORK_DIR / "machsuite_xilinx__post_frontend"
WORK_DIR_CHSTONE = WORK_DIR / "chstone_xilinx__post_frontend"

WORK_DIR_BASE = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space_base")
WORK_DIR_BASE_POLYBENCH = WORK_DIR_BASE / "polybench_xilinx__post_frontend"
WORK_DIR_BASE_MACHSUITE = WORK_DIR_BASE / "machsuite_xilinx__post_frontend"
WORK_DIR_BASE_CHSTONE = WORK_DIR_BASE / "chstone_xilinx__post_frontend"

USE_CACHE = False

design_dirs = sorted(
    list(WORK_DIR_POLYBENCH.glob("*"))
    + list(WORK_DIR_MACHSUITE.glob("*"))
    + list(WORK_DIR_CHSTONE.glob("*"))
)

df_space = build_df(design_dirs)
df_space["type"] = "space"

design_dirs_base = sorted(
    list(WORK_DIR_BASE_POLYBENCH.glob("*"))
    + list(WORK_DIR_BASE_MACHSUITE.glob("*"))
    + list(WORK_DIR_BASE_CHSTONE.glob("*"))
)
df_base = build_df(design_dirs_base)
df_base["type"] = "base"

# stack df
df = pd.concat([df_space, df_base], ignore_index=True)
df = df.sort_values("name_unique")
# impl__utilization__RAMB36 + impl__utilization__RAMB18
df["impl__utilization__RAM"] = (
    df["impl__utilization__RAMB36"] + df["impl__utilization__RAMB18"]
)


# group by dataset and print the number of designs
df_base = df[df["type"] == "base"]
df_space = df[df["type"] == "space"]

# print(df_base["dataset_name"].value_counts())
# print(df_space["dataset_name"].value_counts())

df_space_0_list = []
df_space_1_list = []
for dataset_name, df_dataset in df_space.groupby("dataset_name"):
    len_df = len(df_dataset)
    # random split
    df_dataset_0 = df_dataset.sample(frac=0.5, random_state=42)
    df_dataset_1 = df_dataset.drop(df_dataset_0.index)
    df_space_0_list.append(df_dataset_0)
    df_space_1_list.append(df_dataset_1)

df_space_0 = pd.concat(df_space_0_list, ignore_index=True)
df_space_1 = pd.concat(df_space_1_list, ignore_index=True)
# assert that the designs are non overlapping
assert len(set(df_space_0["name_unique"]) & set(df_space_1["name_unique"])) == 0

# make a new column in df for this split_type
df_base["split_type"] = "base"
df_space_0["split_type"] = "space_0"
df_space_1["split_type"] = "space_1"

print(f"total number of samples: {len(df)}")
print(f"total number of samples base: {len(df_base)}")
print(f"total number of samples space_0: {len(df_space_0)}")
print(f"total number of samples space_1: {len(df_space_1)}")
print(f"total number of samples space_0 + space_1: {len(df_space_0) + len(df_space_1)}")


df = pd.concat([df_base, df_space_0, df_space_1], ignore_index=True)
# pd.Categorical(
df["split_type"] = pd.Categorical(
    df["split_type"], categories=["space_1", "space_0", "base"], ordered=True
)

# assert there are no repeated names
assert len(df["name_unique"]) == len(set(df["name_unique"]))


print(f"total number of samples: {len(df)}")

# make a sns stacked histogram
color_map = {
    "base": "#99d98c",
    "space_0": "#48cae4",
    "space_1": "#ade8f4",
}

plt.rcParams.update({"font.size": 10})

fig, axs = plt.subplot_mosaic(
    [["latency", "latency", "latency", "latency"], ["lut", "ff", "dsp", "bram"]],
    figsize=(7, 4),
)

ax_name_map = {
    "latency": "hls_synth__latency_average_cycles",
    "lut": "impl__utilization__Total LUTs",
    "ff": "impl__utilization__FFs",
    "bram": "impl__utilization__RAM",
    "dsp": "impl__utilization__DSP Blocks",
}

ax_title_map = {
    "latency": "Average-Case Latency",
    "lut": "LUTs",
    "ff": "FFs",
    "bram": "BRAM",
    "dsp": "DSP",
}
for ax_name, ax in axs.items():
    if ax_name in ["latency", "lut", "ff"]:
        sns.kdeplot(
            df,
            x=ax_name_map[ax_name],
            hue="split_type",
            multiple="stack",
            linewidth=0.2,
            palette=color_map,
            log_scale=(True, False),
            ax=ax,
            bw_adjust=0.25,
            clip=(0, None),
            legend=False,
        )
        ax.xaxis.set_minor_formatter(NullFormatter())
    else:
        # sns.histplot(
        #     df,
        #     x=ax_name_map[ax_name],
        #     hue="split_type",
        #     multiple="stack",
        #     bins=10,
        #     palette=color_map,
        #     log_scale=(False, False),
        #     ax=ax,
        #     legend=False,
        # )
        out_liers = df[
            df[ax_name_map[ax_name]] > df[ax_name_map[ax_name]].quantile(0.90)
        ]
        df_no_outliers = df.drop(out_liers.index)
        max_val = df_no_outliers[ax_name_map[ax_name]].max()
        sns.kdeplot(
            df_no_outliers,
            x=ax_name_map[ax_name],
            hue="split_type",
            multiple="stack",
            linewidth=0.2,
            palette=color_map,
            log_scale=(False, False),
            ax=ax,
            bw_adjust=0.25,
            clip=(0, max_val),
            legend=False,
        )
        # add small text in top right saying *90th percentile
        ax.text(
            0.94,
            0.95,
            "*90th percentile",
            verticalalignment="top",
            horizontalalignment="right",
            transform=ax.transAxes,
            fontsize=7,
        )
        # symlog
        # ax.set_yscale("symlog")
        ax.set_xlim(0, max_val)
    # ax.set_xlabel(ax_name)

    if ax_name in ["ff", "bram", "dsp"]:
        ax.set_ylabel("")
    else:
        ax.set_ylabel("Density", fontsize=10)

    if ax_name == "latency":
        ax.set_xlabel("Cycles", fontsize=10)
    else:
        ax.set_xlabel("Resource Count", fontsize=10)

    # chnage y axis label font size
    ax.set_ylabel

    ax.set_title(ax_title_map[ax_name])
    ax.tick_params(axis="y", labelsize=6)
    ax.tick_params(axis="x", labelsize=7)

ax_latency = axs["latency"]

legend_artist = [
    Rectangle((0, 0), 1, 1, fc=color_map[split_type])
    for split_type in ["base", "space_0", "space_1"]
]
ax_latency.legend(
    legend_artist,
    [
        "Base Designs (no optimizations)",
        f"Sampled Designs: n={len(df_space_0)}",
        f"Sampled Designs: n={len(df_space_1) + len(df_space_0)}",
    ],
    loc="upper left",
    fontsize=7,
    title="Design Space",
    title_fontsize=7,
)

# fig.suptitle("Effect of Design Sapce Sampling on Measured Design Metrics", fontsize=14)
fig.tight_layout()
fig.savefig(FIGURES_DIR / "design_space_stacked.png", dpi=300)
