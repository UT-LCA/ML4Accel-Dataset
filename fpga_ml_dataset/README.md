# FPGA_ML_DATASET
This is the datasets used for fpga performance evaluation via machine learning. It contains thousands of verilog designs which can be used to train machine learning model and perform performance prediction.
It contains two categories according to the source of programs: HLS_dataset and Verilog_dataset.

## HLS_dataset
It contains verilog designs generated from C program via high level synthesis. We refered to [PowerGear](https://github.com/zlinaf/PowerGear) and extended their methods to apply to varities of C benchmark to increase the diversities of verilog designs. This repo summarize how the generated verilog design look like while it does not contain the actual generated verilog designs, we compressed the actual designs in tar balls, you should be able to download them with the below links.
- polybench     
it currently contains designs generated for two fpgas:  
[xc7v585tffg1157-3.tar.gz](https://lca.ece.utexas.edu/hls_dataset/xc7v585tffg1157-3.tar.gz)   
[xczu9eg-ffvb1156-2-i.tar.gz](  https://lca.ece.utexas.edu/hls_dataset/xczu9eg-ffvb1156-2-i.tar.gz)   

- chstone  
work in progress  

- machsuite  
work in progress

Noted that in each tar ball, it contains:
1. verilog files and tcl scripts which can be used directly in vivado
2. IR codes(*.bc), IR operator information(*.adb), FSMD model(*.adb.xml) generated from vivado HLS

## Verilog_dataset
It contains verilog designs collected from different domains. It contains only raw designs and general info generated from yosys about the designs.

## Directory Structure
    .
    ├── HLS_dataset                           # machine learning dataset for high level synthesis, Verilog designs generated from C codes
    │   ├── polybench                         # benchmark name
    │   │   ├── atax                          # kernel name
    │   │   │   ├── scripts                   # tcl scripts to run hls, synthesis, implementation and evaluation
    │   │   │   ├── src                       # source code in C which is marked with hls pragma
    │   │   │   ├── testbench                 # testbenches in verilog to test generated designs
    │   │   │   ├── xczu9eg-ffvb1156-2-i      # info.csv: post-implementation reousrces and clock freuqency targeting xczu9eg 
    │   │   │   │                               post_hls_info.csv: resource esimates and clock period esimates targeting xczu9eg
    │   │   │   └── xc7v585tffg1157-3         # same as above but targeting xc7v585
    │   │   ├── bicg
    │   │   ├── gemm
    │   │   ├── gesummv
    │   │   ├── k2mm
    │   │   ├── k3mm
    │   │   ├── mvt
    │   │   ├── syr2k
    │   │   └── syrk
    │   └── chstone                           # work in progress, it contains only C code now
    │   └── machsuite                         # work in progress, it contains only C code now
    └── Verilog_dataset                       # Veriog designs, work in progress
        ├── opencores                         # verilog designs(*.v), and general info which is generated from yosys about the designs (*.out)
        ├── vtr_designs
        └── yosys_designs
        
## Use case
These dataset can be potentailly used for:
1. resources usage prediction from HLS
2. power prediction from hls
3. cross-fpga metics prediction (power, resource usage, freq etc.) 
4. resource usage prediction from Verilog

## Contact
Zhigang Wei: zw5259@utexas.edu  
Aman Arora:  aman.kbm@utexas.edu
  
  
## TODO
1. csv files alignment, name of the csv file (post_implemnetaion_info.csv) (done)
2. tar ball update: remove report files (done)
3. one more high hierechy (done)
4. update the csv with the features in ppt (done)
5. example use case in github readme (done)
6. overleaf for the short paper on arxiv


