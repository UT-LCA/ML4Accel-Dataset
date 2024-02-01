import sys
import os
import io
import subprocess
import time
import datetime
import math
import shutil
import argparse
import csv


#############################################################
#def remove_redundant(prj_dir, prj_name):
#    os.system('cp {a}/{b}/prj.runs/impl_exe/wrapper.bit {a}/{b}/bitstream.bit'.format(a = prj_dir, b = prj_name))
#    os.system('cp {a}/{b}/prj.runs/impl_exe/wrapper.ltx {a}/{b}/status_probe.ltx'.format(a = prj_dir, b = prj_name))
#    if os.path.exists('{}/{}/prj.cache'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.cache'.format(prj_dir, prj_name))
#    if os.path.exists('{}/{}/prj.hw'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.hw'.format(prj_dir, prj_name))
#    if os.path.exists('{}/{}/prj.ip_user_files'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.ip_user_files'.format(prj_dir, prj_name))
#    if os.path.exists('{}/{}/prj.runs'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.runs'.format(prj_dir, prj_name))
#    if os.path.exists('{}/{}/prj.sim'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.sim'.format(prj_dir, prj_name))
#    if os.path.exists('{}/{}/prj.srcs'.format(prj_dir, prj_name)):
#        shutil.rmtree('{}/{}/prj.srcs'.format(prj_dir, prj_name))
#    os.remove('{}/{}/prj.xpr'.format(prj_dir, prj_name))
    

#############################################################
#def compress(prj_dir, compress_dir, prj_name):
#    os.system('7z a {c}/{a}.7z {b}/{a}'.format(a = prj_name, b = prj_dir, c = compress_dir))


#############################################################
#def remove_project(prj_dir, prj_name):
#    shutil.rmtree('{}/{}'.format(prj_dir, prj_name))
    

def on_board_extract(prj_dir):
    with open('{}/../../power_measurement.csv'.format(prj_dir), 'r+') as f:
       reader = csv.reader(f)
       onboard_power_dic = {rows[0]:[rows[1],rows[2]] for rows in reader}
    return onboard_power_dic

#############################################################
def resource_extract(prj_dir, prj_name):
    with open('{}/{}/utilization.xls'.format(prj_dir, prj_name), 'r+') as f:
       lines = f.readlines()

    for line in lines:
       if line.find('kernel') > 0:
          line_list = line.split('|')
          line_list = [s.strip() for s in line_list]
          line_list = [x for x in line_list if x]
          if line_list[0] == 'kernel':
             if prj_dir.find('xczu9eg') >= 0:
                return line_list[2:9] + [line_list[10]]
             elif prj_dir.find('xc7v585') >= 0:
                return line_list[2:]
             else:
                assert "no board found for the utilization"


#############################################################
def timing_extract(prj_dir, prj_name):
    with open('{}/{}/timing.xls'.format(prj_dir, prj_name), 'r+') as f:
       lines = f.readlines()

    for idx, line in enumerate(lines):
       if line.find('Frequency') > 0:
          nxt_line = lines[idx + 2]
          line_list = nxt_line.split()
          line_list = [s.strip() for s in line_list]
          line_list = [x for x in line_list if x]
          return line_list[4]


#############################################################
def vpower_extract(prj_dir, prj_name):
    with open('{}/{}/power.xls'.format(prj_dir, prj_name),  'r+') as f:
       lines = f.readlines()

    for line in lines:
       if line.find('kernel') > 0:
          line_list = line.split('|')
          line_list = [s.strip() for s in line_list]
          line_list = [x for x in line_list if x]
          return line_list[1]


#############################################################
def run_routine(prj_list, prj_dir):
    prj_cnt = 0
    onboard_power_dic =  on_board_extract(prj_dir)

    utilization_dic = {}
    vpower_dic = {}
    freq_dic = {}
    for prj_name in prj_list:
       if os.path.exists('{}/{}/power.xls'.format(prj_dir, prj_name)) and \
            os.path.exists('{}/{}/utilization.xls'.format(prj_dir, prj_name)):

          utilization_dic[prj_name] = resource_extract(prj_dir, prj_name)
          vpower_dic[prj_name] = vpower_extract(prj_dir, prj_name)
          freq_dic[prj_name] = timing_extract(prj_dir, prj_name)
          prj_cnt = prj_cnt + 1
       else:
          print('{}/{}'.format(prj_dir, prj_name))

    file_path = '{}/post_implementation_info.csv'.format(prj_dir)
    if os.path.exists(file_path):
       os.system('rm ' + file_path)

    with open(file_path, 'w+', newline='') as f:
       #title = ['prj', 'total_pwr(uW)', 'static_pwr(uW)', 'dynamic_pwr(mW)', 'vivado_dynamic_pwr(mW)','Total LUTs','Logic LUTs','LUTRAMs','SRLs', 'FFs', 'RAMB36', 'RAMB18', 'URAM', 'DSP48 Blocks']
       #title = ['prj', 'vivado_dynamic_pwr(mW)','Total LUTs','Logic LUTs','LUTRAMs','SRLs', 'FFs', 'RAMB36', 'RAMB18', 'URAM', 'DSP48 Blocks', 'freq(MHz)']
       title = ['prj', 'vivado_dynamic_pwr(mW)','Total LUTs','Logic LUTs','LUTRAMs','SRLs', 'FFs', 'RAMB36', 'RAMB18', 'DSP48 Blocks', 'freq(MHz)']
       writer = csv.writer(f)
       writer.writerow(title)
       for prj in vpower_dic:
         wr_line = [prj]  + [vpower_dic[prj]]+ utilization_dic[prj] + [100]
         writer.writerow(wr_line)

    return prj_cnt


#############################################################
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'automatic Vivado data collect script', epilog = '')
    parser.add_argument('--prj_dir', help = 'directory of Vivado project as input', required=True, action = 'store')
    args = parser.parse_args()
    prj_dir = os.getcwd() + '/' + args.prj_dir
    prj_list = sorted(os.walk('{}'.format(prj_dir)).__next__()[1])
    prj_cnt = run_routine(prj_list, prj_dir)

    print('vivado projects: project num = {}\n'.format(prj_cnt))
