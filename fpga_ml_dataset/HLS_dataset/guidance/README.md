# Scripts Guide (under construction, Xilinx vivado flow only)
This guide how to use the scripts to regenerate the dataset, this flow can be also used for the extension of the dataset.
The flow to generate the dataset contains several phase:
1. High Level Synthesis: automate the pragamas to generate varities of hardware designs from the same source codes
2. Implementation and Synthesis
3. Evaluation: timing report, power report and utilization report.
4. Data collect: collect necessary data to construct the csv files

## High Level Synthesis
**parser.py** takes **hls_template.tcl** and **opt_template.tcl** to generate sets of **hls.tcl** and **opt.tcl**.   
Noted that both hls_tempalte and opt_template are source code specific.

**hls.tcl** will generate varities of projects according to the parameters defined in **opt.template.tcl**.   

The example use of **parser.py** can be:
```bash
python3 parser.py --opt_template opt_template.tcl --hls_template hls_template.tcl --output_path [PATH to the solutions]
```
To launch the run with vivado:
```bash
vivado_hls -f hls.tcl
```

## Implementation and Synthesis (need to be refined)
The example use of **auto_run.py**:
```bash
python3 auto_run.py --hls_dir [hls_prj_dir] --src_dir [src_code_dir] --prj_dir [vivado_prj_dir]
cd [path_to_script_0]
vivado -mode batch -nojournal -nolog -notrace -source script_0.tcl
```
**auto_run.sh** can also be also referred to as an example use of the script.

## Evaluation
**info_extract.py** generates the tcl file to report timing, utilization and power. Noted power reports can be correctly generated only when the testbenches are included.  

The example use of **info_extract.py**:
```bash
python3 info_extract.py --prj_dir [prj_dir]
cd [prj_dir]
vivado -mode batch -nojournal -nolog -notrace -source script_0.tcl
```

**timing.xls, utilization.xls, power.xls** are generated under each project folder.

## Data collect
**info_collect.py** is used to construct post_implementation_info.csv for each source code.  

**hls_feature_extract.py** is used to construct post_hls_info.csv for each source code.  

The example uses of the scripts are:
```bash
python3 hls_feature_extract.py  --prj_dir [prj_dir] --kernel_name [kernel_name] --csv_file [PATH/post_hls_info.csv]
python3 info_collect.py --prj_dir [prj_dir]
```

**info_collect.sh** and **hls_feature_extract.sh** are used in the real experiment.  

Noted that **hls_feature_extract.py** assumes that kernel name under [prj_dir] is the same.
