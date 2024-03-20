import json
from itertools import cycle
from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
from scipy.spatial import ConvexHull
from sklearn.compose import ColumnTransformer
from sklearn.decomposition import PCA
from sklearn.discriminant_analysis import StandardScaler
from sklearn.kernel_approximation import Nystroem
from sklearn.manifold import TSNE, Isomap
from sklearn.pipeline import Pipeline
from umap import UMAP

from hls_experiments.convex_hull_plotting import draw_rounded_hull

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)

WORK_DIR = Path("/usr/scratch/skaram7/hlsdataset_workdir_design_space")


WORK_DIR_POLYBENCH = WORK_DIR / "polybench_xilinx_post_frontend"
WORK_DIR_MACHSUITE = WORK_DIR / "machsuite_xilinx_post_frontend"

# design_dirs = sorted(list(WORK_DIR_POLYBENCH.glob("*"))) + sorted(
#     list(WORK_DIR_MACHSUITE.glob("*"))
# )

# all_data = []
# for design_dir in design_dirs:
#     data_design_fp = design_dir / "data_design.json"
#     data_hls_fp = design_dir / "data_hls.json"
#     if not data_design_fp.exists() or not data_hls_fp.exists():
#         continue
#     data_hls = json.loads(data_hls_fp.read_text())
#     data_design = json.loads(data_design_fp.read_text())

#     dataset_name = design_dir.parent.name
#     name_unique = design_dir.name

#     data = {
#         "name_unique": name_unique,
#         "dataset_name": dataset_name,
#         **data_design,
#         **data_hls,
#     }
#     all_data.append(data)

# df = pd.DataFrame(all_data)

# df.to_csv(DATA_DIR / "design_space.csv", index=False)

df = pd.read_csv(DATA_DIR / "design_space.csv")

# "latency_best_cycles",
# "latency_average_cycles",
# "latency_worst_cycles",
# make binary columsn for if these colums are nan
df["latency_best_cycles_is_estimated"] = df["latency_best_cycles"].notna()
df["latency_average_cycles_is_estimated"] = df["latency_average_cycles"].notna()
df["latency_worst_cycles_is_estimated"] = df["latency_worst_cycles"].notna()
# replace any nan rows with -1
# df["latency_best_cycles"].fillna(-1, inplace=True)
# df["latency_average_cycles"].fillna(-1, inplace=True)
# df["latency_worst_cycles"].fillna(-1, inplace=True)
df["latency_best_cycles"] = df["latency_best_cycles"].fillna(-1)
df["latency_average_cycles"] = df["latency_average_cycles"].fillna(-1)
df["latency_worst_cycles"] = df["latency_worst_cycles"].fillna(-1)

id_design_name = "name"

columns_to_plot = [
    "clock_period",
    "latency_best_cycles",
    "latency_average_cycles",
    "latency_worst_cycles",
    "latency_best_cycles_is_estimated",
    "latency_average_cycles_is_estimated",
    "latency_worst_cycles_is_estimated",
    "resources_lut_used",
    "resources_ff_used",
    "resources_dsp_used",
    "resources_bram_used",
    "resources_uram_used",
]

numeric_columns = [
    "clock_period",
    "latency_best_cycles",
    "latency_average_cycles",
    "latency_worst_cycles",
    "resources_lut_used",
    "resources_ff_used",
    "resources_dsp_used",
    "resources_bram_used",
    "resources_uram_used",
]

binary_columns = [
    "latency_best_cycles_is_estimated",
    "latency_average_cycles_is_estimated",
    "latency_worst_cycles_is_estimated",
]


# print any rows that have nan in colimns to plot
# pd.set_option("display.max_columns", None)
# print(df[df[columns_to_plot].isna().any(axis=1)])
# print number of rows with nan in columns to plot
# print(df[columns_to_plot].isna().any(axis=1).sum())
# print the unique values in the dataset_name column
# exit()

design_names = df[id_design_name]
design_names_unique = df[id_design_name].unique()

# sklearn pipline for scaling and pca
pipeline = Pipeline(
    [
        # ("scaling", StandardScaler()),
        # column scaling
        (
            "column_preprocessing",
            ColumnTransformer(
                [
                    ("scaling", StandardScaler(), numeric_columns),
                    ("binary", "passthrough", binary_columns),
                ]
            ),
        ),
        ("kernel", Nystroem(kernel="rbf", n_components=64, random_state=42)),
        # ("tansform", TSNE(n_components=2, perplexity=30, random_state=42)),
        (
            "tansform",
            UMAP(n_components=2, min_dist=0.5, n_neighbors=32, n_jobs=16, verbose=True),
        ),
        # ("tansform", Isomap(n_components=2)),
        # ("tansform", PCA(n_components=2, random_state=42)),
    ]
)

x = df[columns_to_plot]
x_pca = pipeline.fit_transform(x)

df_transformed = pd.DataFrame(
    pd.concat([df[id_design_name], pd.DataFrame(x_pca)], axis=1)
)
df_transformed.columns = [id_design_name, "PC1", "PC2"]


cm = matplotlib.colormaps["tab20"]
colors = {
    design_name: color
    for design_name, color in zip(design_names_unique, cycle(list(cm.colors)))
}

convex_hulls = {}
for design_name in df_transformed[id_design_name].unique():
    df_design = df_transformed[df_transformed[id_design_name] == design_name]
    data_coords = df_design[["PC1", "PC2"]].values
    print(data_coords.shape)
    print(data_coords)
    hull = ConvexHull(data_coords, qhull_options="QJ")
    convex_hulls[design_name] = hull

fig, ax = plt.subplots(figsize=(10, 10))
for design_name, df_group in df_transformed.groupby(id_design_name):
    ax.scatter(
        df_group["PC1"],
        df_group["PC2"],
        s=2.0,
        label=design_name,
        color=colors[design_name],
    )
    x_points = df_group[["PC1", "PC2"]].to_numpy()
    draw_rounded_hull(
        x_points,
        convex_hulls[design_name],
        ax,
        padding=1.0,
        line_kwargs=dict(color=colors[design_name], linewidth=1),
        fill_kwargs=dict(alpha=0.15, color=colors[design_name]),
    )

    # poly = Polygon(
    #     df_group[["PC1", "PC2"]].values[convex_hulls[design_name].vertices],
    #     # edgecolor=colors[design_name],
    #     facecolor=colors[design_name],
    #     alpha=0.15,
    #     zorder=-1,
    # )
    # ax.add_patch(poly)


ax.legend()

fig.tight_layout()
fig.savefig(FIGURES_DIR / "design_space_pca.png", dpi=300)
