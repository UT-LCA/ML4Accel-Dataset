# HLS Build Script

> [!WARNING!]: This tool is a work in progress and is subject to change as it is developed. It is not complete and has not been fully tested on all designs.

`hls_build_script.py` is a python script that allows you to build HLS deisngs uing Vitis HLS and extract the performance and resource utilization reports.

Below is the help message for the script:

```text
usage: hls_build_script.py [-h] [-j N_JOBS] design_dirs [design_dirs ...]

positional arguments:
  design_dirs           List of design directories to build

options:
  -h, --help            show this help message and exit
  -j N_JOBS, --n_jobs N_JOBS
                        Number of jobs to use for building
```

The tool expects the folling in each design directory:
- `dataset_hls.tcl` - A TCL script that runs HLS synthesis for the design when called using `vitis_hls`

The tool generates the following in each design directory if the build is successful:
- `data_design.json` - A JSON file containing the design metadata including name, part, target clock period, and versions of Vitis HLS and Vivado used (if available).
- `data_hls.json` - A JSON file containing the latency and resource utilization report data of the synthesized design after HLS synthesis.

Below are examples of what these JSON files look like.

`data_design.json`:
```json
{
    "name": "fpga_gcn_qm9_top",
    "part": "xczu9eg-ffvb1156-2-e",
    "target_clock_period": 3.33,
    "version_vitis_hls": "2023.1.1",
    "version_vivado": null
}
```

`data_hls.json`:
```json
{
    "clock_period": 4.553e-09,
    "latency_best_cycles": 13616,
    "latency_best_seconds": 6.1993648e-05,
    "latency_average_cycles": null,
    "latency_average_seconds": null,
    "latency_worst_cycles": 201491,
    "latency_worst_seconds": 0.0009173885230000001,
    "resources_lut_used": 323295,
    "resources_ff_used": 395898,
    "resources_dsp_used": 2438,
    "resources_bram_used": 6860,
    "resources_uram_used": 0
}
```