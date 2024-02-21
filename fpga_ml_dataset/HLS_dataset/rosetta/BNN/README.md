Introduction
------------------------------------------------------------------------
bnn-fpga is an open-source implementation of a binarized neural network (BNN)
accelerator for CIFAR-10 on FPGA.
The architecture and training of the BNN is proposed by [Courbarieaux et al.][2]
and open-source Python code is available at https://github.com/MatthieuCourbariaux/BinaryNet.

Our accelerator targets low-power embedded field-programmable SoCs and was
tested on a Zedboard. At time of writing the error rate on the 10000 images
in the CIFAR-10 test set is **11.19%**.

[2]: https://arxiv.org/abs/1602.02830

Build Setup
------------------------------------------------------------------------
You will need Xilinx SDSoC on your PATH and the Vivado HLS
header include files on your CPATH.

Verified SDSoC versions: 2016.4, 2017.1

With these tools in place do the following from the repository root:
```
  % source setup.sh
  % cd data; ./get_data.sh; cd ..
  % cd params; ./get_params.sh; cd ..
```
This will set environment variables and download data and parameter zip files.

To build the software model:
```
  % cd cpp
  % make -j4
```

To build the FPGA bitstream do (with the software build complete):
```
  % cd cpp/accel/sdsoc_build
  % make -j4
```
Post-route timing and area information is available in 
**sdsoc_build/\_sds/reports/sds.rpt**.

Branches
------------------------------------------------------------------------
The master branch contains a debug build including a random testbench,
a per-layer testbench, and a full bnn testbench. The optimized branch
contains only the full testbench.

FPGA Evaluation
------------------------------------------------------------------------
1. After the FPGA bitstream is finished building, copy the **sd_card** 
directory onto an SD card.
2. Copy both **data** and **params** directories onto the same SD card.
3. Insert the card into the Zedboard and power on the Zedboard.
4. Connect to the Zedboard via USB and wait for the boot sequence to finish.
5. At the terminal prompt do the following:
```
  % cd mnt
  % export CRAFT_BNN_ROOT=.
  % ./accel_test_bnn.exe <N>
```
Where N is the number of images you want to test. Up to 10000 images from
the CIFAR-10 test set are available. The program will print out the
prediction accuracy and accelerator runtime at the end. Note that the
program performs weight binarization and reordering before invoking
the accelerator so there will be a pause at the very beginning.

Varying the Number of Convolvers
------------------------------------------------------------------------
Go to **cpp/accel/Accel.h** and change CONVOLVERS to the desired number
(must be a power of 2). You must do a make clean and rebuild everything
from scratch.

Known Issues and Bugs
------------------------------------------------------------------------
1. SDSoC compilation error due to glibc include file
This occurs if SDSoC sees the native version of glibc on CPATH, overriding the ARM version for cross-compilation. The fix is to remove /usr/include from CPATH. In some cases this prevents SDSoC from seeing zlib; currently the suggested fix is to build zlib in a different (non-system) directory and add that to CPATH.
