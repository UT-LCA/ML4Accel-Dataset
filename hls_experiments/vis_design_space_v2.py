import json
from itertools import cycle
from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from matplotlib.patches import Rectangle
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

if not (DATA_DIR / "design_space_v2_transformed.csv").exists() or not USE_CACHE:
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

    df.to_csv(DATA_DIR / "design_space_v2.csv", index=False)
    df = pd.read_csv(DATA_DIR / "design_space_v2.csv")

    colums_for_plot = [
        "name_unique",
        "dataset_name",
        "name",
        "type",
        "hls_synth__latency_best_cycles",
        "hls_synth__latency_average_cycles",
        "hls_synth__latency_worst_cycles",
        "hls_synth__resources_lut_used",
        "hls_synth__resources_ff_used",
        "hls_synth__resources_dsp_used",
        "hls_synth__resources_bram_used",
        "hls_synth__resources_uram_used",
        "impl__utilization__Total LUTs",
        "impl__utilization__Logic LUTs",
        "impl__utilization__LUTRAMs",
        "impl__utilization__SRLs",
        "impl__utilization__FFs",
        "impl__utilization__RAMB36",
        "impl__utilization__RAMB18",
        "impl__utilization__URAM",
        "impl__utilization__DSP Blocks",
        "impl__timing__wns",
        "impl__timing__tns",
        "impl__timing__whs",
        "impl__timing__ths",
        "impl__timing__wpws",
        "impl__timing__tpws",
        "impl__power__total_power",
        "impl__power__dynamic_power",
        "impl__power__static_power",
    ]

    columns_for_pca = [
        "hls_synth__latency_best_cycles",
        "hls_synth__latency_average_cycles",
        "hls_synth__latency_worst_cycles",
        "hls_synth__resources_lut_used",
        "hls_synth__resources_ff_used",
        "hls_synth__resources_dsp_used",
        "hls_synth__resources_bram_used",
        "hls_synth__resources_uram_used",
        "impl__utilization__Total LUTs",
        "impl__utilization__Logic LUTs",
        "impl__utilization__LUTRAMs",
        "impl__utilization__SRLs",
        "impl__utilization__FFs",
        "impl__utilization__RAMB36",
        "impl__utilization__RAMB18",
        "impl__utilization__URAM",
        "impl__utilization__DSP Blocks",
        "impl__timing__wns",
        "impl__timing__tns",
        "impl__timing__whs",
        "impl__timing__ths",
        "impl__timing__wpws",
        "impl__timing__tpws",
        "impl__power__total_power",
        "impl__power__dynamic_power",
        "impl__power__static_power",
    ]

    df_plotting = df[colums_for_plot].copy()
    print(df_plotting["name"].value_counts())
    print(df_plotting.dropna()["name"].value_counts())

    pre_na = set(df_plotting["name"].unique())
    post_na = set(df_plotting.dropna()["name"].unique())

    # show any names that were removed due to missing data
    print(pre_na - post_na)

    df_plotting = df_plotting.dropna()

    for design_name, df_group in df_plotting.groupby("name"):
        if df_group["type"].nunique() == 1 and df_group["type"].unique()[0] == "base":
            df_plotting = df_plotting[df_plotting["name"] != design_name]

    pipeline = Pipeline(
        [
            (
                "scale",
                StandardScaler(),
                # RobustScaler(),
            ),
            (
                "kernel",
                Nystroem(kernel="poly", degree=3, n_components=32, random_state=42),
            ),
            (
                "tansform",
                PaCMAP(
                    n_components=2,
                    n_neighbors=50,
                    verbose=True,
                    random_state=42,
                ),
            ),
        ]
    )

    x = df_plotting[columns_for_pca]
    x_pca = pipeline.fit_transform(x)
    x_pca_df = pd.DataFrame(x_pca, columns=["PC_0", "PC_1"])

    # concat side by side

    df_plotting = df_plotting.reset_index(drop=True)
    x_pca_df = x_pca_df.reset_index(drop=True)
    df_transformed = pd.concat([df_plotting, x_pca_df], axis=1)
    df_transformed.to_csv(DATA_DIR / "design_space_v2_transformed.csv", index=False)
else:
    df_transformed = pd.read_csv(DATA_DIR / "design_space_v2_transformed.csv")


def plot_grouped_data(
    df,
    grouping_id,
    ax,
    colors: dict | None = None,
    legend_label_map: dict | None = None,
    base_designs_df: pd.DataFrame | None = None,
) -> list:
    grouping_names = df[grouping_id].unique()

    if colors is None:
        cm = matplotlib.colormaps["tab20"]
        colors_iter = cycle(cm.colors)
        colors = {name: color for name, color in zip(grouping_names, colors_iter)}

    for group_name in grouping_names:
        if group_name not in colors:
            raise ValueError(f"Missing color for {group_name}")

    convex_hulls = {}
    for group_name in grouping_names:
        df_group = df[df[grouping_id] == group_name]
        data_coords = df_group[["PC_0", "PC_1"]].values
        hull = ConvexHull(data_coords, qhull_options="QJ")
        convex_hulls[group_name] = hull

    for group_name in grouping_names:
        df_group = df[df[grouping_id] == group_name]
        ax.scatter(
            df_group["PC_0"],
            df_group["PC_1"],
            s=4.0,
            marker="x",
            label=group_name,
            color=colors[group_name],
        )
        x_points = df_group[["PC_0", "PC_1"]].to_numpy()
        draw_rounded_hull(
            x_points,
            convex_hulls[group_name],
            ax,
            padding=0.3,
            line_kwargs=dict(color=colors[group_name], linewidth=1),
            fill_kwargs=dict(alpha=0.15, color=colors[group_name]),
        )
        if base_designs_df is not None:
            base_designs = base_designs_df[base_designs_df[grouping_id] == group_name]
            ax.scatter(
                base_designs["PC_0"],
                base_designs["PC_1"],
                s=50,
                marker="o",
                edgecolors="black",
                label=group_name,
                color=colors[group_name],
            )

    if legend_label_map is not None:
        leg_labels = [legend_label_map[name] for name in grouping_names]
    else:
        leg_labels = list(grouping_names)

    leg_artists = [
        Rectangle((0, 0), 1, 1, color=colors[group_name], label=legend_label)
        for group_name, legend_label in zip(grouping_names, leg_labels)
    ]

    ax.set_xlabel("Projection $x_0$")
    ax.set_ylabel("Projection $x_1$")
    ax.set_xticks([])
    ax.set_yticks([])

    return leg_artists


base_df = df_transformed[df_transformed["type"] == "base"]
print(base_df["name"].value_counts())

fig, axs = plt.subplots(2, 1, figsize=(8, 6))
ax = axs[0]
leg_artists = plot_grouped_data(
    df_transformed,
    "name",
    ax,
    base_designs_df=base_df,
)
ax.legend(
    handles=leg_artists,
    # loc="lower right",
    loc="upper left",
    ncol=1,
    fontsize=6,
    labelspacing=0.2,
    handletextpad=0.5,
    ncols=3,
)
ax.set_title("Design Space Visualization: Grouped by Design", fontsize=14)

# dataset_colors = {
#     "polybench_xilinx": "#ffba08",
#     "machsuite_xilinx": "#f08080",
#     "chstone_xilinx": "#d00000",
# }

dataset_colors = {
    "machsuite_xilinx": "#f6bd60",
    "polybench_xilinx": "#00b4d8",
    "chstone_xilinx": "#d62828",
}

dataset_labels = {
    "polybench_xilinx": "Polybench",
    "machsuite_xilinx": "MachSuite",
    "chstone_xilinx": "CHStone",
}

ax = axs[1]
leg_artists = plot_grouped_data(
    df_transformed,
    "dataset_name",
    ax,
    colors=dataset_colors,
    legend_label_map=dataset_labels,
    base_designs_df=base_df,
)
ax.legend(
    handles=leg_artists,
    # loc="lower right",
    loc="upper left",
    ncol=1,
    fontsize="small",
    labelspacing=0.2,
    handletextpad=0.5,
    ncols=1,
)
ax.set_title("Design Space Visualization: Grouped by Benchmark", fontsize=14)


fig.tight_layout()
fig.savefig(FIGURES_DIR / "design_space_v2_combined.png", dpi=300)


# fig, axs = plt.subplot_mosaic(
#     [
#         [
#             "hls_synth__latency_average_cycles",
#             "hls_synth__latency_average_cycles",
#             "hls_synth__latency_worst_cycles",
#             "hls_synth__latency_best_cycles",
#         ],
#         [
#             "hls_synth__resources_lut_used",
#             "hls_synth__resources_ff_used",
#             "hls_synth__resources_dsp_used",
#             "hls_synth__resources_bram_used",
#         ],
#         [
#             "impl__utilization__Total LUTs",
#             "impl__utilization__FFs",
#             "impl__utilization__DSP Blocks",
#             "impl__utilization__RAMB36",
#         ],
#     ],
#     figsize=(12, 12),
# )

# title_map = {
#     "hls_synth__latency_average_cycles": "HLS Latency: Average Cycles",
#     "hls_synth__latency_worst_cycles": "HLS Latency: Worst Cycles",
#     "hls_synth__latency_best_cycles": "HLS Latency: Best Cycles",
#     "hls_synth__resources_lut_used": "HLS Resources: LUTs",
#     "hls_synth__resources_ff_used": "HLS Resources: FFs",
#     "hls_synth__resources_dsp_used": "HLS Resources: DSPs",
#     "hls_synth__resources_bram_used": "HLS Resources: BRAMs",
#     "impl__utilization__Total LUTs": "Impl. Utilization: Total LUTs",
#     "impl__utilization__FFs": "Impl. Utilization: FFs",
#     "impl__utilization__DSP Blocks": "Impl. Utilization: DSPs",
#     "impl__utilization__RAMB36": "Impl. Utilization: RAMB36",
# }

# x_axis_label_map = {
#     "hls_synth__latency_average_cycles": "# Cycles",
#     "hls_synth__latency_worst_cycles": "# Cycles",
#     "hls_synth__latency_best_cycles": "# Cycles",
#     "hls_synth__resources_lut_used": "Count",
#     "hls_synth__resources_ff_used": "Count",
#     "hls_synth__resources_dsp_used": "Count",
#     "hls_synth__resources_bram_used": "Count",
#     "impl__utilization__Total LUTs": "Count",
#     "impl__utilization__FFs": "Count",
#     "impl__utilization__DSP Blocks": "Count",
#     "impl__utilization__RAMB36": "Count",
# }


# for label, ax in axs.items():
#     # sns.kdeplot(
#     #     data=df_transformed,
#     #     x=label,
#     #     ax=ax,
#     #     clip=(0, None),
#     #     hue="dataset_name",
#     #     log_scale=(True, False),
#     #     common_norm=False,
#     #     bw_adjust=0.25,
#     #     hue_order=["polybench_xilinx", "machsuite_xilinx", "chstone_xilinx"],
#     #     palette=dataset_colors.values(),
#     #     fill=True,
#     # )
#     # sns.boxenplot(
#     #     data=df_transformed,
#     #     x="dataset_name",
#     #     y=label,
#     #     ax=ax,
#     #     palette=dataset_colors.values(),
#     # )

#     # if label == "impl__utilization__RAMB36":
#     #     print(
#     #         df_transformed[["dataset_name", label]].groupby("dataset_name").describe()
#     #     )
#     ax.set_xlabel(x_axis_label_map[label])
#     # rename the legend labels
#     ax.legend(
#         labels=["Polybench", "MachSuite", "CHStone"],
#         loc="upper right",
#         fontsize="small",
#     )
#     ax.set_title(title_map[label])

# fig.tight_layout()
# fig.savefig(FIGURES_DIR / "design_space_v2_kde.png", dpi=300)
