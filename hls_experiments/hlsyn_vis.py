import json
from itertools import cycle
from pathlib import Path

import matplotlib
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt
from matplotlib.patches import Rectangle
from pacmap import PaCMAP
from scipy.spatial import ConvexHull
from sklearn.compose import ColumnTransformer
from sklearn.decomposition import PCA, TruncatedSVD
from sklearn.kernel_approximation import Nystroem
from sklearn.manifold import TSNE, Isomap
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import RobustScaler, StandardScaler
from umap import UMAP

from hls_experiments.convex_hull_plotting import draw_rounded_hull

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)


WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_parallel_test_run")

USE_CACHE = True

if not (DATA_DIR / "hlsyn_design_space_plot_data.csv").exists() or not USE_CACHE:
    datasets = list(WORK_DIR.glob("*__post_frontend"))

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
        design_name = deisgn_data_single["design_id"]
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
                print(f"Design {design_name} is missing data files")
            if not data_execution_time_fp.exists():
                print(f"Design {design_name} is missing execution time file")

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
            "design_id": design_name,
            "dataset_name": dataset_name,
            "parallel_type": parallel_type,
            **data_design,
            **data_hls,
            **data_vitis_hls_execution_time,
            **data_timeout,
        }
        df_data.append(ratio_data)

    df = pd.DataFrame(df_data)
    df_ours = df[df["parallel_type"] == "naive"]

    hlsyn_dir = DIR_CURRENT_SCRIPT.parent / "fpga_ml_dataset" / "HLS_dataset" / "hlsyn"
    hlsyn_vitis_hls_version = "2020.2"
    hlsyn_vitis_part = "xilinx_u200"
    hlsyn_target_clock_period = 4.0
    hlsyn_dataset_name = "hlsyn"

    hlsyn_data_files = sorted(list((hlsyn_dir / "designs").glob("*.json")))
    hlsyn_data = []
    for hlsyn_data_file in hlsyn_data_files:
        design_name = hlsyn_data_file.stem
        json_data = json.loads(hlsyn_data_file.read_text())
        for design_point, data_point in json_data.items():
            if data_point["valid"] is False:
                continue
            design_id = f"{design_name}.{design_point}"

            resource_bram = int(
                round(
                    data_point["res_util"]["total-BRAM"]
                    * data_point["res_util"]["util-BRAM"]
                )
            )
            resource_dsp = int(
                round(
                    data_point["res_util"]["total-DSP"]
                    * data_point["res_util"]["util-DSP"]
                )
            )
            resource_lut = int(
                round(
                    data_point["res_util"]["total-LUT"]
                    * data_point["res_util"]["util-LUT"]
                )
            )
            resource_ff = int(
                round(
                    data_point["res_util"]["total-FF"]
                    * data_point["res_util"]["util-FF"]
                )
            )

            data = {
                "design_id": design_id,
                "dataset_name": hlsyn_dataset_name,
                "name": design_name,
                "part": hlsyn_vitis_part,
                "target_clock_period": hlsyn_target_clock_period,
                "version_vitis_hls": hlsyn_vitis_hls_version,
                "latency_average_cycles": data_point["perf"],
                "resources_lut_used": resource_lut,
                "resources_ff_used": resource_ff,
                "resources_bram_used": resource_bram,
                "resources_dsp_used": resource_dsp,
            }

            hlsyn_data.append(data)

    df_hlsyn = pd.DataFrame(hlsyn_data)

    print(f"len(df_ours): {len(df_ours)}")
    print(f"len(df_hlsyn): {len(df_hlsyn)}")

    new_df = pd.concat([df_ours, df_hlsyn], ignore_index=True, axis=0)

    columns_to_keep = [
        "design_id",
        "dataset_name",
        "latency_average_cycles",
        "resources_lut_used",
        "resources_ff_used",
        "resources_bram_used",
        "resources_dsp_used",
    ]

    columns_for_pca = [
        "latency_average_cycles",
        "resources_lut_used",
        "resources_ff_used",
        "resources_bram_used",
        "resources_dsp_used",
    ]

    df_plotting = new_df[columns_to_keep]
    df_plotting = df_plotting.dropna()

    print(
        f"len(df_plotting[df_plotting['dataset_name']=='hlsyn']): {len(df_plotting[df_plotting['dataset_name']=='hlsyn'])}"
    )
    print(
        f"len(df_plotting[df_plotting['dataset_name']!='hlsyn']): {len(df_plotting[df_plotting['dataset_name']!='hlsyn'])}"
    )

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

    df_transformed.to_csv(DATA_DIR / "hlsyn_design_space_plot_data.csv", index=False)
else:
    df_transformed = pd.read_csv(DATA_DIR / "hlsyn_design_space_plot_data.csv")


cm = matplotlib.colormaps["tab20"]
dataset_names = df_transformed["dataset_name"].unique()


colors = {
    "polybench_xilinx": "#ffba08",
    "machsuite_xilinx": "#f08080",
    "chstone_xilinx": "#d00000",
    "hlsyn": "#48cae4",
}


# print(colors)

convex_hulls = {}
for dataset_name in dataset_names:
    df_dataset = df_transformed[df_transformed["dataset_name"] == dataset_name]
    data_coords = df_dataset[["PC_0", "PC_1"]].values
    hull = ConvexHull(data_coords, qhull_options="QJ")
    convex_hulls[dataset_name] = hull


fig, ax = plt.subplots(figsize=(6, 6))
# for design_name, df_group in df_transformed.groupby(id_design_name):
#     ax.scatter(
#         df_group["PC1"],
#         df_group["PC2"],
#         s=2.0,
#         label=design_name,
#         color=colors[design_name],
#     )
#     x_points = df_group[["PC1", "PC2"]].to_numpy()
#     draw_rounded_hull(
#         x_points,
#         convex_hulls[design_name],
#         ax,
#         padding=1.0,
#         line_kwargs=dict(color=colors[design_name], linewidth=1),
#         fill_kwargs=dict(alpha=0.15, color=colors[design_name]),
#     )

for dataset_name, df_group in df_transformed.groupby("dataset_name"):
    ax.scatter(
        df_group["PC_0"],
        df_group["PC_1"],
        s=3.0,
        marker="x",
        label=dataset_name,
        color=colors[dataset_name],
    )
    x_points = df_group[["PC_0", "PC_1"]].to_numpy()
    draw_rounded_hull(
        x_points,
        convex_hulls[dataset_name],
        ax,
        padding=1,
        line_kwargs=dict(color=colors[dataset_name], linewidth=1),
        fill_kwargs=dict(alpha=0.15, color=colors[dataset_name]),
    )

leg_name_map = {
    "polybench_xilinx": "Polybench (Our Work)",
    "machsuite_xilinx": "MachSuite (Our Work)",
    "chstone_xilinx": "CHStone (Our Work)",
    "hlsyn": "HLSyn",
}

leg_artists = []
for dataset_name in dataset_names:
    leg_artists.append(
        Rectangle(
            (0, 0),
            1,
            1,
            fc=colors[dataset_name],
            edgecolor="none",
            label=leg_name_map[dataset_name],
        )
    )
ax.legend(handles=leg_artists, loc="upper right", fontsize="small")
ax.set_xlabel("Projection $x_0$")
ax.set_ylabel("Projection $x_1$")
# remove x ticks
ax.set_xticks([])
ax.set_yticks([])

ax.set_title(
    "Design Space Comparison with HLSyn of\nHLS Reported Average Latency & Resource Usage"
)
fig.tight_layout()
fig.savefig(FIGURES_DIR / "hlsyn_design_space.png", dpi=300)


# create histograms for each dataset
# top row is one big panel latency
# bottom row is four panels for resources
df_hist = df_transformed.copy()
df_hist["dataset_name"] = df_hist["dataset_name"].apply(
    lambda x: "our_work" if x != "hlsyn" else x
)

fig = plt.figure(figsize=(12, 6))

# top row
ax = fig.add_subplot(2, 4, (1, 4))
for dataset_name, df_group in df_transformed.groupby("dataset_name"):
    sns.kdeplot(
        data=df_hist,
        x="latency_average_cycles",
        ax=ax,
        hue="dataset_name",
        fill=True,
        alpha=0.5,
        common_norm=False,
        # log_scale=(True, False),
        clip=(0, None),
    )
ax.set_title("Average Latency (Cycles)")
ax.set_xlabel("Latency (Cycles)")

# bottom row
resource_names = [
    "resources_lut_used",
    "resources_ff_used",
    "resources_bram_used",
    "resources_dsp_used",
]

for i, resource_name in enumerate(resource_names):
    ax = fig.add_subplot(2, 4, i + 5)
    for dataset_name, df_group in df_transformed.groupby("dataset_name"):
        sns.kdeplot(
            data=df_hist,
            x=resource_name,
            ax=ax,
            hue="dataset_name",
            fill=True,
            alpha=0.5,
            common_norm=False,
            # log_scale=(True, False),
            clip=(0, None),
        )
    ax.set_title(f"Resource Usage: {resource_name}")
    ax.set_xlabel(f"Resource Usage: {resource_name}")

fig.tight_layout()
fig.savefig(FIGURES_DIR / "hlsyn_design_space_histogram.png", dpi=300)
