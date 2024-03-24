import sys
import os
import io
import shutil
import argparse
import itertools

class ARRAY_PARTITION:
    #the first line as the input array_settings
    def __init__(self, array_settings):
        setting_lists = array_settings.split(',')
        self.num_of_directives = int(setting_lists[1])
        self.factors = setting_lists[2].strip('[]').split()
        self.arr_types = setting_lists[3].strip('[]').split()
        #lines are actual templates to wrtie to tcl files
        self.directives = []
    
    def get_flattened(self):
        output = []
        for factor in self.factors:
            for array_type in self.arr_types:
                output.append([factor, array_type])
        return output                

    def get_num_of_directives(self):
        return self.num_of_directives
    def append_directives(self,line):
        self.directives.append(line)
    def get_directives(self):
        return self.directives

class LOOP_OPT:
    def __init__(self, loop_settings):
        self.num_of_parameters = int(loop_settings.split(',')[1])
        self.num_of_directives = int(loop_settings.split(',')[2])
        #lines are actual templates to wrtie to tcl files
        self.directives = []
        #factors/parameters for the tcl files in strings
        self.parameter_lines=[]
    
    def get_flattened(self):
        output = []
        for line in self.parameter_lines:
            loop_name = line.split(',')[1]
            loop_pipeline = True if (line.split(',')[2].strip() == 'pipeline') else False
            loop_unroll = True if (line.split(',')[3].strip() == 'unroll') else False
            unroll_factor_lists = line.split(',')[4].strip('[]').split()
            unroll_factor_lists = [x.strip('[]') for x in unroll_factor_lists]
            for unroll_factor in unroll_factor_lists:
                output.append([loop_name,loop_pipeline,loop_unroll,unroll_factor])
        return output

    def append_parameters(self,line):
        self.parameter_lines.append(line)
    def append_directives(self,line):
        self.directives.append(line)
    def get_directives(self):
        return self.directives
    def get_num_of_parameters(self):
        return self.num_of_parameters
    def get_num_of_directives(self):
        return self.num_of_directives

#################################################
def parse_template(src_template):
    array_partition_object_lists = []
    loop_opt_object_lists = []
    static_lines = str()
    with open(src_template, 'r+') as f:
        lines = f.readlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.strip().startswith('#') or line.rstrip() == '':
            i += 1
            continue
        
        if line.strip().startswith('array_partition'):
            array_partition_object = ARRAY_PARTITION(line.strip())
            for x in range(array_partition_object.get_num_of_directives()):
                i += 1
                array_partition_object.append_directives(lines[i])
            array_partition_object_lists.append(array_partition_object)
            i += 1
            continue
        
        if line.strip().startswith('loop_opt'):
            loop_opt_object = LOOP_OPT(line.strip())
            for x in range(loop_opt_object.get_num_of_parameters()):
                i += 1
                loop_opt_object.append_parameters(lines[i])
            
            for x in range(loop_opt_object.get_num_of_directives()):
                i += 1
                loop_opt_object.append_directives(lines[i])
            
            loop_opt_object_lists.append(loop_opt_object)

            i += 1
            continue
        
        static_lines += line
        i += 1
    
    return array_partition_object_lists, loop_opt_object_lists, static_lines


def gen_opt(array_partition_object_lists, loop_opt_object_lists):
    array_partition_lines = []
    for array_partition_object in array_partition_object_lists:
        directive_lines = array_partition_object.get_directives()
        array_block_lines = []
        for array_settings in array_partition_object.get_flattened():
            #factor is 1, no need to set directives
            if array_settings[0].strip() == '1':
                array_block_lines.append('')
                continue
            
            output_line = str()
            for line in directive_lines:
                temp_line = line.replace('[factor]', array_settings[0])
                temp_line = temp_line.replace('[type]', array_settings[1])
                output_line = output_line + temp_line
            
            array_block_lines.append(output_line)
        
        array_partition_lines.append(array_block_lines)    
    array_partition_lines = list(itertools.product(*array_partition_lines))

    loop_opt_lines = []
    for loop_opt_object in loop_opt_object_lists:
        lines = loop_opt_object.get_directives()
        directive_pipeline_lines = []
        directive_unroll_lines = []
        for i in range(len(lines)):
            if lines[i].find("set_directive_pipeline") >= 0:
                directive_pipeline_lines.append(lines[i])
            else:
                directive_unroll_lines.append(lines[i])
        #by default, nothing to apply to the unroll and pipeline
        loop_opt_block = []
        #loop_opt_block.append('')
        for loop_opt_settings in loop_opt_object.get_flattened():
            output_line = str()
            #need to pipeline
            if loop_opt_settings[1] == True:
                for line in directive_pipeline_lines:
                    temp_line = line.replace('[name]', loop_opt_settings[0])
                    output_line += temp_line
            
            #need to unroll
            if loop_opt_settings[2] == True:
                for line in directive_unroll_lines:
                    temp_line = line.replace('[factor]', loop_opt_settings[3])
                    temp_line = temp_line.replace('[name]', loop_opt_settings[0])
                    output_line += temp_line
        
            loop_opt_block.append(output_line)
        
        loop_opt_lines.append(loop_opt_block)
    loop_opt_lines = list(itertools.product(*loop_opt_lines))
    return array_partition_lines, loop_opt_lines
    

def generate_tcl(src_hls, output_path, array_partition_lines, loop_opt_lines, static_lines):
    #write opt.tcl files
    num_of_generated_tcls = 0
    for a_line in array_partition_lines:
        for l_line in loop_opt_lines:
            num_of_generated_tcls += 1
            output_dir = '{}/{}'.format(output_path, num_of_generated_tcls)
            if os.path.isdir(output_dir) == False:
                os.mkdir(output_dir)
            output_file = '{}/opt.tcl'.format(output_dir)
            f = open(output_file, 'w+')

            f.write(static_lines)
            f.write('\n')

            for x in a_line:
                f.write(x)
                f.write('\n')
            
            for x in l_line:
                f.write(x)
                f.write('\n')
            
            f.close()
    
    #open the hls_template file and write the final hls file used to run hls
    with open(src_hls, 'r+') as f:
        src_hls_lines = f.readlines()
    
    hls_f = open('{}/hls.tcl'.format(output_path), 'w+')

    for i in range(1, num_of_generated_tcls + 1):
        prj_path = '{}'.format(i)
        opt_tcl = '{}/opt.tcl'.format(i)

        for line in src_hls_lines:
            t_line = line.replace('[prj_path]', prj_path)
            t_line = t_line.replace('[opt_tcl]', opt_tcl)
            hls_f.write(t_line)
        hls_f.write('\n')
    
    hls_f.close()
    return num_of_generated_tcls

#############################################################
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'Generate opt tcl scritps to automatically run HLS design', epilog = '')
    parser.add_argument('--opt_template', required=True, help = 'source opt template files as the input')
    parser.add_argument('--output_path', required=True, help='the path to store the opt files, the path need to exsits already')
    parser.add_argument('--hls_template', required=True, help='the src template hls file as the input')
    args = parser.parse_args()
    src_hls = args.hls_template
    src_template = args.opt_template
    output_path = args.output_path

    assert os.path.isdir(output_path), f"the output_path: {output_path} does not exsit"
    assert os.path.exists(src_hls), f"the src_hls: {src_hls} does not exsit"
    array_partition_object_lists, loop_opt_object_lists, static_lines = parse_template(src_template)
    array_partition_lines, loop_opt_lines = gen_opt(array_partition_object_lists, loop_opt_object_lists)
    num_of_generated_tcls = generate_tcl(src_hls, output_path, array_partition_lines, loop_opt_lines, static_lines)

    print('{} tcls generated'.format(num_of_generated_tcls))
    #print(static_lines)
