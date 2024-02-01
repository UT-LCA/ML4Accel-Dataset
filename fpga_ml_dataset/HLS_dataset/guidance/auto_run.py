import sys
import os
import io
import shutil
import argparse


#############################################################
def gen_script(fw, prj_dir, src_dir, ip_dir, prj_name, iob, board_type):
    src_name = 'io_p{}'.format(iob)
    fw.write('create_project prj {a}/{b} -part {c}\n'.format(a=prj_dir, b=prj_name, c=board_type))    
    #fw.write('set_property board_part xilinx.com:zcu102:part0:3.2 [current_project]\n')
    fw.write('add_files -norecurse {{{a}/{b}/rtl/wrapper.v {a}/{b}/rtl/mem_ctrl.v {a}/{b}/rtl/macro.v {a}/{b}/rtl/sdp_ram.v {a}/{b}/rtl/sp_rom.v {a}/{b}/rtl/kernel_ram.v}}\n'.format(a=src_dir, b=src_name))
    fw.write('add_files -fileset sim_1 -norecurse {}/{}/rtl/tb_wrapper.v\n'.format(src_dir, src_name))
    fw.write('create_fileset -constrset constraint\n')
    fw.write('add_files -fileset constraint -norecurse {}/constraint/constraint.xdc\n'.format(ip_dir))
    #fw.write('add_files {}/ip/clk_wiz_0/clk_wiz_0.xci\n'.format(ip_dir))
    #fw.write('add_files {}/ip/vio_0/vio_0.xci\n'.format(ip_dir))

    if os.path.exists('{}/{}/solution/syn/verilog'.format(hls_dir, prj_name)):
        verilog_dir = '{}/{}/solution/syn/verilog'.format(hls_dir, prj_name)
    elif os.path.exists('{}/{}/verilog'.format(hls_dir, prj_name)):
        verilog_dir = '{}/{}/verilog'.format(hls_dir, prj_name)
    
    for file in os.listdir(verilog_dir):
        if file.endswith('.v'):
            fw.write('add_files -norecurse {}/{}\n'.format(verilog_dir, file))
    
    for file in os.listdir(verilog_dir):
        if file.endswith('.tcl'):
            fw.write('source {}/{}\n'.format(verilog_dir, file))
    
    fw.write('create_run synth_exe -constrset constraint -flow {Vivado Synthesis 2018}\n')
    fw.write('create_run impl_exe -parent_run synth_exe -flow {Vivado Implementation 2018}\n')
    fw.write('set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AlternateRoutability [get_runs synth_exe]\n')
    fw.write('set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_exe]\n')
    fw.write('set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE ExploreWithRemap [get_runs impl_exe]\n')
    fw.write('set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE WLDrivenBlockPlacement [get_runs impl_exe]\n')
    fw.write('set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_exe]\n')
    fw.write('set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_exe]\n')
    fw.write('set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE MoreGlobalIterations [get_runs impl_exe]\n')
    fw.write('set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_exe]\n')
    fw.write('set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_exe]\n')

    fw.write('update_ip_catalog\n')
    fw.write('current_run [get_runs synth_exe]\n')
    fw.write('set_param general.maxThreads 8\n')
    fw.write('launch_runs impl_exe -jobs 32\n')
    #fw.write('launch_runs impl_exe -to_step write_bitstream -jobs 8\n')
    fw.write('wait_on_run impl_exe\n')

    fw.write('set synth_time [get_property STATS.ELAPSED [get_runs synth_exe]]\n')
    fw.write('puts "synth time: $synth_time"\n')
    fw.write('set par_time [get_property STATS.ELAPSED [get_runs impl_exe]]\n')
    fw.write('puts "par time: $par_time"\n')
    fw.write('set fp [open {}/{}/runtime.txt w]\n'.format(prj_dir, prj_name))
    fw.write('puts $fp $synth_time\n')
    fw.write('puts $fp $par_time\n')
    fw.write('close $fp\n')

    fw.write('close_project\n')
    fw.write('\n')


#############################################################
def traverse_directive(fw, prj_dir, src_dir, ip_dir, prj_list, script_num, board_type):
    fter = open('{}/../auto_run/prj_terminated.txt'.format(prj_dir), 'w+')
    frun = open('{}/../auto_run/prj_to_run.txt'.format(prj_dir), 'w+')
    ffin = open('{}/../auto_run/prj_finished.txt'.format(prj_dir), 'w+')
    prj_cnt = 0
    terminate_cnt = 0
    finished_cnt = 0
    for prj_name in prj_list:
        if(not prj_name == '') and  (not os.path.exists('{}/{}/prj.runs/impl_exe/wrapper.bit'.format(prj_dir, prj_name))):
            if 'io1' in prj_name:
                iob = 1
            elif 'io2' in prj_name:
                iob = 2
            elif 'io4' in prj_name:
                iob = 4
            elif 'io8' in prj_name:
                iob = 8
            else:
                print('CHECK: prj_name = {} has io partition error'.format(prj_name))
                assert(0)

            gen_script(fw[prj_cnt % script_num], prj_dir, src_dir, ip_dir, prj_name, iob, board_type)
            prj_cnt = prj_cnt + 1
            frun.write('{}\n'.format(prj_name))

            if os.path.exists('{}/{}/prj.hw/'.format(prj_dir, prj_name)):
                terminate_cnt = terminate_cnt + 1
                fter.write('{}\n'.format(prj_name))
                print('Terminate prj: {}'.format(prj_name))
                # shutil.rmtree('{}/{}'.format(prj_dir, prj_name))

        if os.path.exists('{}/{}/prj.runs/impl_exe/wrapper.bit'.format(prj_dir, prj_name)):
            finished_cnt = finished_cnt + 1
            ffin.write('{}\n'.format(prj_name))

    fter.close()
    frun.close()
    return prj_cnt, terminate_cnt, finished_cnt


#############################################################
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'automatic Vivado run script', epilog = '')
    parser.add_argument('--script_num', help = "number of scripts to run parallely", action = 'store', default = 1)
    parser.add_argument('--hls_dir', required = True, help = 'directory of HLS project as input', action = 'store')
    parser.add_argument('--prj_dir', required = True, help = "directory to generate vivado project", action = 'store')
    parser.add_argument('--src_dir', required = True, help = "directory of RTL wrapper source", action = 'store')
    parser.add_argument('--board_type', required = True, help = "the board type to be evaluated", action = 'store')
    parser.add_argument('--ip_dir', help = "directory of ip and constraint source", action = 'store', default = '../peripheral')
    args = parser.parse_args()
    script_num = int(args.script_num)
    board_type = args.board_type
    hls_dir = os.getcwd() + '/' + args.hls_dir
    prj_dir = os.getcwd() + '/' + args.prj_dir
    src_dir = os.getcwd() + '/' + args.src_dir
    ip_dir = os.getcwd() + '/' + args.ip_dir
    if not os.path.exists(prj_dir):
        os.system('mkdir {}'.format(prj_dir))
    if not os.path.exists('{}/../auto_run'.format(prj_dir)):
        os.system('mkdir {}/../auto_run'.format(prj_dir))

    fw = []
    for i in range(0, script_num):
        file = open('{}/../auto_run/script_{}.tcl'.format(prj_dir, i), 'w+')
        fw.append(file)

    print('Proj Name: {}'.format(prj_dir))
    prj_list = os.walk(hls_dir).__next__()[1]
    terminated_list = list()
    for prj_name in prj_list:
        if (not os.path.exists('{}/{}/solution/syn/verilog'.format(hls_dir, prj_name))) and \
            (not os.path.exists('{}/{}/verilog'.format(hls_dir, prj_name))):
            terminated_list.append(prj_name)
    for unfinished_name in terminated_list:
        prj_list.remove(unfinished_name)
    prj_list = sorted(prj_list)

    prj_cnt, terminate_cnt, finished_cnt = traverse_directive(fw, prj_dir, src_dir, ip_dir, prj_list, script_num, board_type)
    total_prj_cnt = len(prj_list)
    print('Total prj num to run = {}'.format(total_prj_cnt))
    print('Prj num to run = {}'.format(prj_cnt))
    print('Prj run finished = {}\n'.format(finished_cnt))

    for i in range(0, script_num):
        fw[i].close()
