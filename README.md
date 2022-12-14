# Data Set for ML-Guided Chip Design

Chip design times have been high typically taking over 3 years from architecture to implementation to deployment, 
and it is extremely hard to keep up with the need for new domain specific chips specifically machine learning (ML) accelerators.  
To reduce this gap, ML itself is being used to improve and expedite the chip design process. ML based methods here replace 
previously used analytical, simulation based or manual methods, leading to improvement in speed or accuracy. ML based methods, 
however, need extensive datasets to train models to produce acceptable results. 

Some examples of works that have used ML in chip design processes are:
- Faster chip placement and floorplanning using Deep Learning (DL) [1] 
- Cross-platform prediction of cycle count and power consumption of an accelerator [2,3] 
- Calibrating analytical tools to improve their accuracy [4]
- Improving the estimation of timing and resource usage for HLS [5]
- Microarchitecture-level power modeling of CPUs [6]
- Fast and accurate cross-platform performance and power prediction [7,8]
- placement quality prediction [9]

This GitHub repo is a well-curated open-source dataset for ML-guided chip design that is being developed at UT Austin.
Ths dataset can be easily used by researchers working with training models for chip design. 

# Contents of the dataset
At the top-level this dataset contains two types of data:

- Data from FPGA development flows (directory called `fpga_ml_dataset`)
- Data from ASIC development flows (directory called `asic_ml_dataset`)

Depending on what a user needs, they can use the data from either or both flows.

There is data for two types of sources in the dataset:
- C applications (from benchmarks such as Polybench, CHStone, Machsuite)
- HDL designs (from benchmarks such as VTR, Koios, OpenCores)

For each source, some examples of features contained in the dataset:
- Size of the design (based on netlist primitives in a non-tech mapped netlist)
- Application domain (signal processing, machine learning, general purpose processor, networking, etc.) 
- Number of arithmetic operators (multiply, add, etc.) and logical (and, or, xor, etc) operators
- Number/size of primary inputs and outputs
- Number of memory bits
- Number of registers, signals, muxes, FSMs (for HDL designs)
- Number of basic blocks, conditionals, loops (for C applications)

For each source, some examples of metrics contained in the dataset:
- Area (or resource usage)
- Power consumption
- Wire lenhth
- Operating frequency

We include information for:
- Multiple FPGA devices from multiple FPGA vendors
- Multiple ASIC libraries/PDKs

We include information for:
- Multiple implementation settings (like HLS pragmas, gate-level synthesis options, etc)
- Multiple process corners

# How to Use?
See the README for the data for each flow (FPGA or ASIC) in the corresponding directories.

# How to Cite?
Coming soon

# References
[1] A. Mirhoseini, A. Goldie, M. Yazgan, J. W. Jiang, E. Songhori, S. Wang, Y.J. Lee, E. Johnson, O. Pathak, A. Nazi, J. Pak, A. Tong, K. Srinivasa, W. Hang, E. Tuncer, Q. V. Le, J. Laudon, R. Ho, R. Carpenter, J. Dean, “A graph placement methodology for fast chip design”, NATURE’21
[2] Kenneth O'Neal, Mitch Liu, Hans Tang, Amin Kalantar, Kennen DeRenard, Philip Brisk, “HLSPredict: Cross Platform Performance Prediction for FPGA High-Level Synthesis”, ICCAD’18
[3] Zhe Lin, Zike Yuan, Jieru Zhao, Wei Zhang, Hui Wang, Yonghong Tian, “PowerGear: Early-Stage Power Estimation in FPGA HLS via Heterogeneous Edge-Centric GNNs”, DATE’22
[4] W. Lee, Y. Kim, J.H. Ryoo, D. Sunwoo, A. Gerstlauer, L. K. John, “PowerTrain: A Learning-based Calibration of McPAT Power Model”, ISLPED’15
[5] Hosein Mohammadi Makrani, Farnoud Farahmand, Hossein Sayadi, Sara Bondi, Sai Manoj Pudukotai Dinakarrao, Houman Homayoun, Setareh Rafatirad, “Pyramid: Machine Learning Framework to Estimate the Optimal Timing and Resource Usage of a High-Level Synthesis Design”, FPL’19
[6] Ajay Krishna Ananda Kumar, Sami Alsalamin, Hussam Amrouch, Andreas Gerstlauer, “Machine Learning-Based Microarchitecture- Level Power Modeling of CPUs”, IEEE Transactions on Computer (TC)’22
[7] Xinnian Zheng, Lizy K. John, Andreas Gerstlauer, “Accurate Phase-Level Cross-Platform Power and Performance Estimation”, DAC’16
[8] Xinnian Zheng, Haris Vikalo, Shuang Song, Lizy K. John, Andreas Gerstlauer, “Sampling-Based Binary-Level Cross-Platform Performance Estimation”, DATE’17
[9] Mingjie Liu, Keren Zhu, Jiaqi Gu, Linxiao Shen, Xiyuan Tang, Nan Sun, David Z. Pan, “Towards Decrypting the Art of Analog Layout: Placement Quality Prediction via Transfer Learning”, DATE’20
