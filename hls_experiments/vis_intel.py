import json
from pathlib import Path

import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt
from matplotlib.lines import Line2D
from matplotlib.ticker import NullFormatter

DIR_CURRENT_SCRIPT = Path(__file__).parent

FIGURES_DIR = DIR_CURRENT_SCRIPT / "figures"
FIGURES_DIR.mkdir(exist_ok=True)

DATA_DIR = DIR_CURRENT_SCRIPT / "data"
DATA_DIR.mkdir(exist_ok=True)


DIR_INTEL_MACHSUITE = Path(
    "/usr/scratch/skaram7/intel_data/machsuite_intel_csv_results"
)
DIR_INTEL_POLYBENCH = Path("/usr/scratch/skaram7/intel_data/Intel_HLSDataset_demo")


def load_data_polybench(data_dir: Path) -> pd.DataFrame:
    # find all data_implementation.json files
    data_files = list(data_dir.rglob("**/data_design.json"))
    data_list = []
    for data_fp in data_files:
        name_unique = data_fp.parent.name
        data_design = json.loads(data_fp.read_text())
        data_implementation_fp = data_fp.parent / "data_implementation.json"
        if not data_implementation_fp.exists():
            print(f"Skipping {data_fp}, missing data_implementation.json")
            continue
        data_implementation = json.loads(data_implementation_fp.read_text())
        name = {
            "name": data_design["name"],
            "name_unique": name_unique,
            "dataset_name": "polybench_intel",
            "clock_speed": data_implementation["clock"],
            "alm": data_implementation["alm"],
            "reg": data_implementation["reg"],
            "dsp": data_implementation["dsp"],
            "ram": data_implementation["ram"],
            "mlab": data_implementation["mlab"],
        }
        data_list.append(name)
    df = pd.DataFrame(data_list)
    return df


def load_data_machsuite(data_dir: Path):
    data_files = list(data_dir.rglob("**/post_implementation.csv"))
    data_list = []
    for data_fp in data_files:
        name = data_fp.parent.parent.name
        df_csv_single = pd.read_csv(data_fp)

        columns_to_keep = [
            "Source File",
            "alm_system",
            "reg_system",
            "dsp_system",
            "ram_system",
            "mlab_system",
            "clock",
        ]
        df_csv_single = df_csv_single[columns_to_keep]

        # rename file to name_unique
        df_csv_single = df_csv_single.rename(columns={"Source File": "name_unique"})
        # rename resources
        df_csv_single = df_csv_single.rename(
            columns={
                "alm_system": "alm",
                "reg_system": "reg",
                "dsp_system": "dsp",
                "ram_system": "ram",
                "mlab_system": "mlab",
            }
        )
        # rename clock to clock_speed
        df_csv_single = df_csv_single.rename(columns={"clock": "clock_speed"})

        df_csv_single["dataset_name"] = "machsuite_intel"
        df_csv_single["name"] = name

        data_list.append(df_csv_single)

    df = pd.concat(data_list, ignore_index=True)
    return df


USE_CHACHE = True
if not USE_CHACHE or not (DATA_DIR / "data_intel.csv").exists():
    print("Computing data")
    df_polybench = load_data_polybench(DIR_INTEL_POLYBENCH)
    print(df_polybench)

    df_machsuite = load_data_machsuite(DIR_INTEL_MACHSUITE)
    print(df_machsuite)

    # check if the columns are excatly the same
    assert set(df_polybench.columns) == set(df_machsuite.columns)

    df_intel = pd.concat([df_polybench, df_machsuite], ignore_index=True)
    df_intel.to_csv(DATA_DIR / "data_intel.csv", index=False)
else:
    print("Loading data from file")
    df_intel = pd.read_csv(DATA_DIR / "data_intel.csv")

# print number of samples
print(df_intel.shape)

# font size
# plt.rcParams.update({"font.size": 12})
fig, axs = plt.subplot_mosaic(
    [
        ["clock_speed", "clock_speed", "clock_speed", "clock_speed"],
        ["alm", "reg", "dsp", "ram"],
    ],
    figsize=(7.5, 4),
)

dataset_colors = {
    "machsuite_intel": "#f6bd60",
    "polybench_intel": "#00b4d8",
}

ax_name_map = {
    "clock_speed": "clock_speed",
    "alm": "alm",
    "reg": "reg",
    "dsp": "dsp",
    "ram": "ram",
}

ax_title_map = {
    "clock_speed": "Clock Speed",
    "alm": "ALMs",
    "reg": "Registers",
    "dsp": "DSPs",
    "ram": "RAMs",
}

for ax_name, ax in axs.items():
    print(ax_name, ax)
    if ax_name in ["clock_speed", "alm", "reg"]:
        sns.kdeplot(
            df_intel,
            hue="dataset_name",
            ax=ax,
            x=ax_name_map[ax_name],
            log_scale=(True, False),
            clip=(0, None),
            fill=True,
            bw_adjust=0.25,
            legend=False,
            palette=dataset_colors,
            hue_order=["polybench_intel", "machsuite_intel"],
        )
    else:
        outliers = df_intel[ax_name_map[ax_name]] > df_intel[
            ax_name_map[ax_name]
        ].quantile(0.90)
        df_no_outliers = df_intel[~outliers]
        max_val = df_no_outliers[ax_name_map[ax_name]].max()

        sns.kdeplot(
            df_no_outliers,
            hue="dataset_name",
            ax=ax,
            x=ax_name_map[ax_name],
            palette=dataset_colors,
            hue_order=["polybench_intel", "machsuite_intel"],
            clip=(0, max_val),
            fill=True,
            bw_adjust=0.25,
            legend=False,
        )

        ax.text(
            0.95,
            0.97,
            "*90th percentile",
            verticalalignment="top",
            horizontalalignment="right",
            transform=ax.transAxes,
            fontsize=7,
        )
        ax.set_xlim(0, max_val)

    if ax_name in ["clock_speed"]:
        ax.set_xlim(10**2, 10**3)
        # don't show minor tick labels
        ax.xaxis.set_minor_formatter(NullFormatter())

    if ax_name in ["reg", "dsp", "ram"]:
        ax.set_ylabel("")

    if ax_name == "clock_speed":
        ax.set_xlabel("Frequency (MHz)", fontsize=9)
    else:
        ax.set_xlabel("Resource Count", fontsize=9)
    ax.set_title(ax_title_map[ax_name])
    ax.tick_params(axis="y", labelsize=6)
    ax.tick_params(axis="x", labelsize=8)

    ax.set_title(ax_title_map[ax_name])

ax_clock_speed = axs["clock_speed"]
leg_artists = [
    Line2D([0], [0], color=dataset_colors["polybench_intel"], lw=4),
    Line2D([0], [0], color=dataset_colors["machsuite_intel"], lw=4),
]
ax_clock_speed.legend(
    leg_artists,
    ["Polybench (Intel)", "MachSuite (Intel)"],
    loc="upper left",
    fontsize=10,
)


# fig.suptitle("Distribution of Intel Design Metrics", fontsize=14)
fig.tight_layout()
# virticle gap between subplots
# plt.subplots_adjust(hspace=0.3)
fig.savefig(FIGURES_DIR / "intel_design_space.png", dpi=300)
