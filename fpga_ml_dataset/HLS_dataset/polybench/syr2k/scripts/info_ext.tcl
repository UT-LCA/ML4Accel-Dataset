open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1n1_l5n1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2n1p1_l5n1p1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io1_l2p1n1_l5p1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n1_l5n1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1n2_l5n1n2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p1_l5n1p1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2n1p2_l5n1p2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p1n1_l5p1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io2_l2p2n1_l5p2n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n1_l5n1n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n2_l5n1n2_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1n4_l5n1n4_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p1_l5n1p1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p2_l5n1p2_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2n1p4_l5n1p4_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p1n1_l5p1n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p2n1_l5p2n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io4_l2p4n1_l5p4n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n1_l5n1n1_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n2_l5n1n2_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n4_l5n1n4_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1n8_l5n1n8_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p1_l5n1p1_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p2_l5n1p2_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p4_l5n1p4_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2n1p8_l5n1p8_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p1n1_l5p1n1_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p2n1_l5p2n1_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p4n1_l5p4n1_l7p8n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1n8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p2_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p4_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7n1p8_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p1n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p2n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p4n1_d1d2/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1/timing.xls
close_design
close_project

open_project /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/prj.xpr
update_compile_order -fileset sources_1
set_property top tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation -mode post-implementation -type functional
open_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/1ms.saif
log_saif [get_objects -r /tb/top/*]
run 1ms
close_saif
close_sim
read_saif /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/1ms.saif
set_units -power mW
report_power -hier all -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/power.xls
open_run impl_exe
report_utilization -hierarchical -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/utilization.xls
report_timing -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/slack.xls -sort_by slack
report_timing_summary -setup -hold -file /home/projects/ljohn/simplescalar/zhigang/PowerGear/dataset/benchmark/utils/vivado/info_extract/../../../target/syr2k/vivado/xc7v585tffg1157-3_prj//io8_l2p8n1_l5p8n1_l7p8n1_d1d2/timing.xls
close_design
close_project

