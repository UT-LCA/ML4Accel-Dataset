# HLSDataset
1. update the readme
2. Qinzhe for the help to change the name of repo
3. a few folders under HLS_dataset
4. prepare the new tar balls without logs and reports
5. ask bagus to upload it on lca
6. udpate the csv files
7. verilog dataset reorganize the yosys .out and verilog files .v (remove .log)
<<<<<<< HEAD
<<<<<<< HEAD

## File Architecture
  .
  ├── HLS_dataset                           # machine learning dataset for high level synthesis, Verilog designs generated from C codes
  │   ├── polybench                         # benchmark name
  │   │   ├── atax                          # kernel name
  │   │   │   ├── scripts                   # tcl scripts to run hls, synthesis, implementation and evaluation
  │   │   │   ├── src                       # source code in C which is marked with hls pragma
  │   │   │   ├── testbench                 # testbenches in verilog to test generated designs
  │   │   │   ├── xczu9eg-ffvb1156-2-i      # contains a info.csv file to summarize the generated verilog designs targeting xczu9eg
  │   │   │   └── xc7v585tffg1157-3         # contains a info.csv file to summarize the generated verilog designs targeting xc7v585
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
      ├── opencores                         # designs from opencores
      ├── vtr_designs
      └── yosys_designs
<<<<<<< HEAD
=======
>>>>>>> parent of adc9abb... Update README.md
=======
>>>>>>> parent of adc9abb (Update README.md)
=======
>>>>>>> 77aa9f935e10900f260af015d6b4cf955592481b
