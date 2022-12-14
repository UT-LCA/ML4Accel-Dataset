# FPGA_ML_DATASET
This part of the dataset contains information extracted from FPGA flows about C applications and HDL designs.
This data can be used for training ML (machine learning) models to perform prediction of multiple performance metrics. 
It contains thousands of designs which can be used to train machine learning model and perform performance prediction.
It contains two categories according to the source of programs: HLS_dataset and Verilog_dataset.

## HLS_dataset
This data is based on C programs and the verilog designs generated from C applications via HLS (high level synthesis). 
We refered to [PowerGear](https://github.com/zlinaf/PowerGear) and extended their methods to apply to varities of C benchmark to increase the diversities of verilog designs. 
There are two parts of the data:

- CSV file
- Tar ball

The CSV file contains features and metrics extracted from the various reports.
Because the size of the generated Verilog designs is very large, we compressed the actual designs in tar balls; you should be able to download them with the below links.

- Polybench     
It currently contains designs generated for two fpgas:  
[xc7v585tffg1157-3.tar.gz](https://lca.ece.utexas.edu/hls_dataset/xc7v585tffg1157-3.tar.gz)   
[xczu9eg-ffvb1156-2-i.tar.gz](  https://lca.ece.utexas.edu/hls_dataset/xczu9eg-ffvb1156-2-i.tar.gz)   

- CHStone  
Work in progress  

- Machsuite  
Work in progress

Note that each tar ball contains:
1. C code and generated Verilog files. (TCL scripts which can be used directly in Xilinx Vivado are also included)
2. IR codes(*.bc), IR operator information(*.adb), FSMD model(*.adb.xml) generated from Xilinx Vivado HLS

## Verilog_dataset
It contains Verilog designs collected from different domains. It contains the raw designs and general info generated from yosys about the designs. 

We plan to add more data for Verilog designs (e.g. by running VTR or Synopsys DC or Cadence Innovus).

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
1. Prediction of metrics (like resource usage, power consumption, frequency, etc) from C code
2. Improving the estimation of these metrics by HLS tools
3. Cross-FPGA prediction of metrics (Predicting from one FPGA device to another FPGA device)
4. Prediction of metrics for larger HDL designs for design space exploration

## Contact
Zhigang Wei: zw5259@utexas.edu  
Aman Arora:  aman.kbm@utexas.edu
  

