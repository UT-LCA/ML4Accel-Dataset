import json
import shutil
from pathlib import Path
from pprint import pp

import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.lines import Line2D
from matplotlib.patches import Patch
from scipy.stats import gmean, wilcoxon

from hls_build_framework.flow_vitis import VitisHLSSynthFlow
from hls_build_framework.framework import DesignDataset
from hls_build_framework.opt_dsl_frontend import OptDSLFrontend

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

    data_design_fp = design_dir / "data_design.json"
    data_hls_fp = design_dir / "data_hls.json"
    data_execution_time_fp = design_dir / "execution_time_data.json"

    if (
        not data_design_fp.exists()
        or not data_hls_fp.exists()
        or not data_execution_time_fp.exists()
    ):
        continue

    data_hls = json.loads(data_hls_fp.read_text())
    data_design = json.loads(data_design_fp.read_text())
    data_execution_time = json.loads(data_execution_time_fp.read_text())
    data_vitis_hls_execution_time = {
        "vitis_hls_dt": data_execution_time["VitisHLSSynthFlow"]["dt"],
    }

    ratio_data = {
        "design_id": design_id,
        "vitis_version": vitis_version,
        **data_design,
        **data_hls,
        **data_vitis_hls_execution_time,
    }
    df_data.append(ratio_data)

df = pd.DataFrame(df_data)

# if any of the design_ids dont have a value count == 2, remove those rows
df = df[df["design_id"].map(df["design_id"].value_counts()) == 2]
df = df.sort_values(by=["design_id", "vitis_version"])

# print(df.columns)

version_0 = "2021_1"
version_1 = "2023_1"

df_version_0 = df[df["vitis_version"] == version_0].sort_values(by="design_id")
df_version_1 = df[df["vitis_version"] == version_1].sort_values(by="design_id")

columns_to_compute_ratios = [
    "vitis_hls_dt",
    "latency_best_cycles",
    "latency_average_cycles",
    "latency_worst_cycles",
    "resources_lut_used",
    "resources_ff_used",
    # "resources_dsp_used",
    # "resources_bram_used",
]

df_ratio = df_version_1[columns_to_compute_ratios].reset_index(
    drop=True
) / df_version_0[columns_to_compute_ratios].reset_index(drop=True)
ratio_data = {}
for column in columns_to_compute_ratios:
    data_column = df_ratio[column]
    data_column = data_column.dropna()
    ratio_average = gmean(data_column)
    ratio_percent_change = (ratio_average - 1) * 100
    ratio_median = data_column.median()
    ratio_median_percent_change = (ratio_median - 1) * 100
    ratio_data[column] = {
        "ratio_average": ratio_average,
        "ratio_average_percent_change": ratio_percent_change,
        "ratio_median": ratio_median,
        "ratio_median_percent_change": ratio_median_percent_change,
    }

median_data = {}
for column in columns_to_compute_ratios:
    data_column_version_0 = df_version_0[column].reset_index(drop=True)
    data_column_version_1 = df_version_1[column].reset_index(drop=True)
    median_data[column] = {
        "median_version_0": data_column_version_0.median(),
        "median_version_1": data_column_version_1.median(),
    }


test_data = {}
for column in columns_to_compute_ratios:
    data_column_version_0 = df_version_0[column].reset_index(drop=True)
    data_column_version_1 = df_version_1[column].reset_index(drop=True)

    df_combined = pd.DataFrame(
        {
            "version_0": data_column_version_0,
            "version_1": data_column_version_1,
        }
    )

    df_combined = df_combined.dropna()
    data_column_version_0 = df_combined["version_0"].to_numpy()
    data_column_version_1 = df_combined["version_1"].to_numpy()

    n_samples = len(data_column_version_0)

    _, p_less = wilcoxon(
        data_column_version_0,
        data_column_version_1,
        alternative="less",
    )

    _, p_greater = wilcoxon(
        data_column_version_0,
        data_column_version_1,
        alternative="greater",
    )

    _, p_two_sided = wilcoxon(
        data_column_version_0,
        data_column_version_1,
        alternative="two-sided",
    )

    test_data[column] = {
        "p_less": p_less,
        "p_greater": p_greater,
        "p_two_sided": p_two_sided,
        "n_samples": n_samples,
    }

data_table = {
    k: {"ratio": ratio_data[k], "test": test_data[k], "median": median_data[k]}
    for k in columns_to_compute_ratios
}
data_table_flat = [
    {
        **{"feature": k},
        **v["ratio"],
        **v["median"],
        **v["test"],
    }
    for k, v in data_table.items()
]

df_data_table = pd.DataFrame(data_table_flat)
df_stats = df_data_table.copy()
# drop the p_less and p_greater columns
df_data_table = df_data_table.drop(
    columns=["p_less", "p_greater", "median_version_0", "median_version_1"]
)


# format percent as xx.xx%
df_data_table["ratio_average_percent_change"] = df_data_table[
    "ratio_average_percent_change"
].map("{:.2f}\\%".format)
# format the ratio as <xx.xx>x
df_data_table["ratio_average"] = df_data_table["ratio_average"].map("{:.2f}x".format)


# format the p values as x.xxxx, add star if p < 0.05, the star should be superscript in latex
def p_val_format(x, cutoff=0.05):
    # return f"{x:.4f}" + ("\\textsuperscript{*}" if x < cutoff else "")
    # any number that looks like 0.0000 after formatting should be shown using scientific notation
    s = ""
    if x < 1e-4:
        s = "{:.2e}".format(x).replace("e-0", "E-")
    else:
        s = "{:.4f}".format(x)
    if x < cutoff:
        s += "\\textsuperscript{*}"
    return s


# df_data_table["p_less"] = df_data_table["p_less"].map(p_val_format)
# df_data_table["p_greater"] = df_data_table["p_greater"].map(p_val_format)
df_data_table["p_two_sided"] = df_data_table["p_two_sided"].map(p_val_format)
# format the n_samples as x
df_data_table["n_samples"] = df_data_table["n_samples"].map("{:d}".format)

df_data_table["feature"] = df_data_table["feature"].replace(
    {
        "vitis_hls_dt": "Vitis HLS Runtime",
        "latency_best_cycles": "Latency (Best Cycles)",
        "latency_average_cycles": "Latency (Average Cycles)",
        "latency_worst_cycles": "Latency (Worst Cycles)",
        "resources_lut_used": "LUTs Used",
        "resources_ff_used": "FFs Used",
        "resources_dsp_used": "DSPs Used",
        "resources_bram_used": "BRAMs Used",
    }
)

version_0_table = version_0.replace("_", ".")
version_1_table = version_1.replace("_", ".")
# df_data_table.columns = [
#     "Feature",
#     "2023.1/2021.1 (Geomean)",
#     "\\% Change",
#     # f"p-value: {version_0_table}$<${version_1_table}",
#     # f"p-value: {version_0_table}$>${version_1_table}",
#     f"Median: {version_0_table}",
#     f"Median: {version_1_table}",
#     f"p-value: {version_0_table}$\\ne${version_1_table}",
#     "N Samples",
# ]
df_data_table.columns = df_data_table.columns.map(
    {
        "feature": "Feature",
        "ratio_average": f"Geomean: {version_1_table} / {version_0_table}",
        "ratio_average_percent_change": "Geomean: \\% Change",
        "ratio_median": f"Median: {version_1_table} / {version_0_table}",
        "ratio_median_percent_change": "Median: \\% Change",
        "p_two_sided": f"p-value: {version_0_table}$\\ne${version_1_table}",
        "n_samples": "N Samples",
    }
)

latex_table = df_data_table.to_latex(
    index=False,
    bold_rows=True,
    # column_format="l|cc|cc|c|c"
)
latex_table_fp = DATA_DIR / "regression_testing_table.tex"
latex_table_fp.write_text(latex_table)
print(latex_table)

# with plt.rc_context(
#     {"text.usetex": True, "text.latex.preamble": r"\usepackage{booktabs}"}
# ):
#     fig, ax = plt.subplots(1, 1, figsize=(10, 5))
#     ax.axis("off")
#     ax.text(0, 0, latex_table)
#     fig.savefig(FIGURES_DIR / "regression_testing_table.png", dpi=300)

color_palette = sns.color_palette("crest", n_colors=6)

FIG_COLORS = {
    "2021_1": color_palette[2],
    "2023_1": color_palette[5],
}

FIG_COLORS = {
    "2021_1": "#f94144",
    "2023_1": "#64b5f6",
}


fig, axs = plt.subplots(2, 2, figsize=(10, 10))


def pair_plot(ax, feature, df_0, df_1, label_0, label_1, title, log_y=False):
    # ax.scatter([0] * len(df_0), df_0[feature], label=label_0)
    # ax.scatter([1] * len(df_1), df_1[feature], label=label_1)

    # for idx in range(len(df_0)):
    #     ax.plot(
    #         [0, 1],
    #         [df_0[feature].iloc[idx], df_1[feature].iloc[idx]],
    #         "k-",
    #         alpha=0.5,
    #     )

    df_combined = pd.DataFrame(
        {
            "version": [label_0] * len(df_0) + [label_1] * len(df_1),
            feature: pd.concat([df_0[feature], df_1[feature]]).to_numpy(),
        }
    )

    sns.stripplot(
        y=feature,
        x="version",
        data=df_combined,
        ax=ax,
        hue="version",
        # hue_order=[label_0, label_1],
        # palette=[FIG_COLORS[label_0], FIG_COLORS[label_1]],
        hue_order=[label_1, label_0],
        palette=[FIG_COLORS[label_1], FIG_COLORS[label_0]],
        size=5,
        alpha=0.75,
        # marker="x",
        # log_scale=(False, log_y),
    )

    shift_for_middle = 0.15

    # make a line line collection
    lines = []
    for idx in range(len(df_0)):
        lines.append(
            [
                (0 + shift_for_middle, df_0[feature].iloc[idx]),
                (1 - shift_for_middle, df_1[feature].iloc[idx]),
            ]
        )

    lc = LineCollection(
        lines,
        colors="gray",
        alpha=0.5,
        linewidths=0.5,
        zorder=-1,
    )
    ax.add_collection(lc)

    mean_0 = df_0[feature].mean()
    mean_1 = df_1[feature].mean()

    median_0 = df_0[feature].median()
    median_1 = df_1[feature].median()
    lower_0 = df_0[feature].quantile(0.25)
    upper_0 = df_0[feature].quantile(0.75)
    lower_1 = df_1[feature].quantile(0.25)
    upper_1 = df_1[feature].quantile(0.75)

    ax.plot(
        [0 + shift_for_middle, 1 - shift_for_middle],
        [median_0, median_1],
        label="Median Difference",
        color="black",
        linestyle="--",
        linewidth=2,
    )

    ax.plot(
        [0 + shift_for_middle, 1 - shift_for_middle],
        [mean_0, mean_1],
        label="Mean Difference",
        color="black",
        linestyle="-",
        linewidth=2,
    )

    ax.errorbar(
        [0 + shift_for_middle],
        [median_0],
        yerr=[[median_0 - lower_0], [upper_0 - median_0]],
        fmt="o",
        color=FIG_COLORS[label_0],
        label=f"{label_0} Median",
        linewidth=4,
        capsize=5,
        capthick=2,
    )

    ax.errorbar(
        [1 - shift_for_middle],
        [median_1],
        yerr=[[median_1 - lower_1], [upper_1 - median_1]],
        fmt="o",
        color=FIG_COLORS[label_1],
        label=f"{label_1} Median",
        linewidth=4,
        capsize=5,
        capthick=2,
    )

    ax.set_xticks([0, 1])
    ax.set_xticklabels([label_0, label_1])

    if log_y:
        ax.set_yscale("log")

    ax.set_title(title)
    return ax


# vitis_hls_dt
pair_plot(
    axs[0, 0],
    "vitis_hls_dt",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "Vitis HLS Runtime",
)

# latency_average_cycles
pair_plot(
    axs[0, 1],
    "latency_average_cycles",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "Latency (Average Cycles)",
    log_y=True,
)

# resources_lut_used
pair_plot(
    axs[1, 0],
    "resources_lut_used",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "LUTs Used",
    log_y=True,
)

# resources_ff_used
pair_plot(
    axs[1, 1],
    "resources_ff_used",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "FFs Used",
    log_y=True,
)

# add a legend at the bottom of the figure as a whole
fig.legend(
    [version_0, version_1],
    loc="lower center",
    ncol=2,
    # bbox_to_anchor=(0.5, 0.01),
    # bbox_transform=fig.transFigure,
)

# leave space on the bottom for the legend
fig.suptitle("Comparison of Vitis HLS Versions\n2021.1 -> 2023.1")
fig.tight_layout()
fig.subplots_adjust(bottom=0.07)
fig.savefig(FIGURES_DIR / "regression_testing_plot.png", dpi=300)


fig, axs = plt.subplots(2, 2, figsize=(8, 5))
# kde plots in each section now


def kde_plot(
    ax,
    feature,
    df_0,
    df_1,
    label_0,
    label_1,
    title,
    log_x=False,
    x_axis_label: None | str = None,
    p_value=None,
    p_val_loc="right",
):
    df_combined = pd.DataFrame(
        {
            "version": [label_0] * len(df_0) + [label_1] * len(df_1),
            feature: pd.concat([df_0[feature], df_1[feature]]).to_numpy(),
        }
    )
    sns.kdeplot(
        data=df_combined,
        x=feature,
        ax=ax,
        label=label_0,
        hue="version",
        # hue_order=[label_0, label_1],
        # palette=[FIG_COLORS[label_0], FIG_COLORS[label_1]],
        hue_order=[label_1, label_0],
        palette=[FIG_COLORS[label_1], FIG_COLORS[label_0]],
        clip=(0, None),
        log_scale=(log_x, False),
        fill=True,
        common_norm=False,
        alpha=0.2,
        linewidth=0.2,
        legend=False,
    )

    if not log_x:
        ax.set_xlim(0, None)

    for idx, version in enumerate([label_0, label_1]):
        mean_val = df_combined[df_combined["version"] == version][feature].mean()
        color = FIG_COLORS[version]
        ax.axvline(mean_val, color=color, linestyle="-", label=f"{version} Mean")

    for idx, version in enumerate([label_0, label_1]):
        median_val = df_combined[df_combined["version"] == version][feature].median()
        color = FIG_COLORS[version]
        ax.axvline(median_val, color=color, linestyle="--", label=f"{version} Median")

    if p_value is not None:
        p_value_fromatted = ""
        if p_value < 1e-3:
            p_value_fromatted = "{:.1e}".format(p_value).replace("e-0", "E-")
        else:
            p_value_fromatted = "{:.3f}".format(p_value)
        if p_value < 0.05:
            p_value_fromatted += "*"

        if p_val_loc == "right":
            loc = (0.79, 0.9)
        elif p_val_loc == "left":
            loc = (0.2, 0.9)

        ax.text(
            # 0.5,
            # 0.5,
            # UPPER RIGHT
            loc[0],
            loc[1],
            # format to three decimal places
            f"p-value: {p_value_fromatted}",
            horizontalalignment="center",
            verticalalignment="center",
            transform=ax.transAxes,
            # PLACE A RECTANGLE AROUND THE TEXT
            bbox=dict(
                facecolor="white",
                edgecolor="black",
                boxstyle="round,pad=0.2",
                linewidth=0.5,
            ),
            fontsize=10,
        )

    if x_axis_label is not None:
        ax.set_xlabel(x_axis_label)

    ax.tick_params(axis="y", labelsize=8)
    ax.tick_params(axis="x", labelsize=8)

    ax.set_title(title, fontsize=13)
    return ax


kde_plot(
    axs[0, 0],
    "vitis_hls_dt",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "HLS Synthesis Runtime",
    log_x=False,
    x_axis_label="Tool Runtime (s)",
    p_value=test_data["vitis_hls_dt"]["p_two_sided"],
    p_val_loc="right",
)

kde_plot(
    axs[0, 1],
    "latency_average_cycles",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "Average-Case Latency",
    log_x=True,
    x_axis_label="Cycles",
    p_value=test_data["latency_average_cycles"]["p_two_sided"],
    p_val_loc="left",
)

kde_plot(
    axs[1, 0],
    "resources_lut_used",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "Resource Usage: LUTs",
    log_x=True,
    x_axis_label="Resource Count",
    p_value=test_data["resources_lut_used"]["p_two_sided"],
    p_val_loc="left",
)

kde_plot(
    axs[1, 1],
    "resources_ff_used",
    df_version_0,
    df_version_1,
    version_0,
    version_1,
    "Resource Usage: FFs",
    log_x=True,
    x_axis_label="Resource Count",
    p_value=test_data["resources_ff_used"]["p_two_sided"],
    p_val_loc="left",
)


# leg = fig.legend(
#     [
#         version_0,
#         version_1,
#         f"{version_0} Mean",
#         f"{version_1} Mean",
#         f"{version_0} Median",
#         f"{version_1} Median",
#     ],
#     loc="lower center",
#     ncol=6,
#     # make the spacing between the items in the legend smaller
#     columnspacing=0.5,
# )


legend_elements = [
    Patch(facecolor=FIG_COLORS[version_0], edgecolor=None, label=version_0, alpha=0.25),
    Patch(facecolor=FIG_COLORS[version_1], edgecolor=None, label=version_1, alpha=0.25),
    Line2D(
        [0], [0], color=FIG_COLORS[version_0], linestyle="-", label=f"{version_0} Mean"
    ),
    Line2D(
        [0], [0], color=FIG_COLORS[version_1], linestyle="-", label=f"{version_1} Mean"
    ),
    Line2D(
        [0],
        [0],
        color=FIG_COLORS[version_0],
        linestyle="--",
        label=f"{version_0} Median",
    ),
    Line2D(
        [0],
        [0],
        color=FIG_COLORS[version_1],
        linestyle="--",
        label=f"{version_1} Median",
    ),
]

leg = fig.legend(
    handles=legend_elements,
    loc="lower center",
    ncol=6,
    # make the spacing between the items in the legend smaller
    columnspacing=0.5,
)

for text in leg.get_texts():
    text.set_text(text.get_text().replace("_", "."))


fig.suptitle(
    "Comparison of Vitis HLS Metrics Between Versions 2021.1 and 2023.1",
    fontsize=15,
)
fig.tight_layout()
fig.subplots_adjust(bottom=0.16)
fig.savefig(FIGURES_DIR / "regression_testing_kde_plot.png", dpi=300)


# new_data = []
# # groupby design_id, each group will have 2 rows, one for each vitis version
# for group_name, group in df.groupby("design_id"):
#     if len(group) != 2:
#         raise ValueError(f"Group {group_name} has more than 2 rows")
#     group = group.sort_values(by="vitis_version")
#     group = group.reset_index(drop=True)
