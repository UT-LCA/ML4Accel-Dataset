#
# Copyright 2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Create a project
open_project project

# Add design files
add_files pointer_double.c
# Add test bench & files
add_files -tb pointer_double_test.c
add_files -tb result.golden.dat

# Set the top-level function
set_top pointer_double

# ########################################################
# Create a solution
open_solution solution1
# Define technology and clock rate
set_part  {xcvu9p-flga2104-2-i}
create_clock -period 4

# Source x_hls.tcl to determine which steps to execute
source x_hls.tcl
# Set any optimization directives
# End of directives

if {$hls_exec == 1} {
	# Run Synthesis and Exit
	
} elseif {$hls_exec == 2} {
	# Run Synthesis, RTL Simulation and Exit
	
} elseif {$hls_exec == 3} { 
	# Run Synthesis, RTL Simulation, RTL implementation and Exit
	
} else {
	# Default is to exit after setup
}

csynth_design


