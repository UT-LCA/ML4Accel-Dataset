import sys
import os
import io
import shutil
import argparse
import itertools
import matplotlib.pyplot as plt

def extract_resource(hls_lines):
    hls_lut_list = []
    hls_ff_list = []
    hls_bram_list = []
    hls_dsp_list = []
    for line in hls_lines:
        if line.startswith('prj'):
            continue
        x = line.split(',')
        hls_bram_list.append(int(x[4]))
        hls_dsp_list.append(int(x[5]))
        hls_ff_list.append(int(x[6]))
        hls_lut_list.append(int(x[7]))
    
    return [hls_bram_list, hls_dsp_list, hls_ff_list, hls_lut_list]


#############################################################
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'collect resource usage of generated designs', epilog = '')
    parser.add_argument('--benchmark', required=True, help = 'benchmark folder as input')
    parser.add_argument('--fpgatype', required=True, help = 'the fpga type to check')
    #parser.add_argument('--post_impl_info', required=True, help = 'post_implementation_info file as input')
    args = parser.parse_args()
    benchmark = args.benchmark
    fpgatype = args.fpgatype
    #post_impl_info = args.post_impl_info
    assert os.path.exists(benchmark), f"the benchmark {benchmark} does not exsit"
    #assert os.path.exists(post_impl_info), f"the hls_info {post_impl_info} does not exsit"

    
    #with open(post_impl_info, 'r+') as f:
    #    impl_lines = f.readlines()
    app_list = os.walk(benchmark).__next__()[1]
    rsc_dict = {}
    for app in app_list:
        post_hls_info = "{c}/{a}/{b}/post_hls_info.csv".format(a=app, b=fpgatype, c=benchmark)
        assert os.path.exists(post_hls_info), f"the hls_info {post_hls_info} does not exsit"
        with open(post_hls_info, 'r+') as f:
            hls_lines = f.readlines()
        rsc_list = extract_resource(hls_lines)
        rsc_dict[app] = rsc_list
    
    #plot lut
    bram_data =[]
    dsp_data = []
    ff_data = []
    lut_data = []
    app_name = []
    for app in rsc_dict:
        app_name.append(app)
        bram_data.append(rsc_dict[app][0])
        dsp_data.append(rsc_dict[app][1])
        ff_data.append(rsc_dict[app][2])
        lut_data.append(rsc_dict[app][3])

    plt.figure(figsize=(25,9))
    x_font_size = 20
    y_font_size = 15
    plt.subplot(141)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.boxplot(bram_data, patch_artist=True, labels=app_name, sym='*')
    plt.xticks(rotation='vertical', fontsize=x_font_size)
    plt.yticks(fontsize=y_font_size)
    plt.ylabel("number of bram", fontsize=y_font_size)
    plt.grid()

    plt.subplot(142)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.boxplot(dsp_data, patch_artist=True, labels=app_name, sym='*')
    plt.xticks(rotation='vertical', fontsize=x_font_size)
    plt.yticks(fontsize=y_font_size)
    plt.ylabel("number of dsp", fontsize=y_font_size)
    plt.grid()

    plt.subplot(143)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.boxplot(ff_data, patch_artist=True, labels=app_name, sym='*')
    plt.xticks(rotation='vertical', fontsize=x_font_size)
    plt.yticks(fontsize=y_font_size)
    plt.ylabel("number of ff", fontsize=y_font_size)
    plt.grid()

    plt.subplot(144)
    plt.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
    plt.boxplot(lut_data, patch_artist=True, labels=app_name, sym='*')
    plt.xticks(rotation='vertical', fontsize=x_font_size)
    plt.yticks(fontsize=y_font_size)
    plt.ylabel("number of lut", fontsize=y_font_size)
    plt.grid()

    #plt.suptitle("box plot of resource utilization by designs generated from polybench")
    # ax = fig.add_axes([0, 0, 1, 1])
    # bp = ax.boxplot(bram_data)
    # show plot
    plt.savefig("polybench.png", bbox_inches='tight')
    plt.savefig("polybench.pdf", bbox_inches='tight')
    #plt.show()

        

    

    # impl_lut_list = []
    # impl_ff_list = []
    # impl_bram_list = []
    # impl_dsp_list = []
    # for line in impl_lines:
    #     if line.startswith('prj'):
    #         continue
    #     x = line.split(',')
    #     impl_lut_list.append(int(x[2]))
    #     impl_ff_list.append(int(x[6]))
    #     impl_bram_list.append(int(x[7])*2 + int(x[8]))
    #     impl_dsp_list.append(int(x[9]))

    # error_lut_list = []
    # error_bram_list = []
    # error_ff_list = []
    # error_dsp_list = []
    # #error        
    # for i in range(len(hls_lut_list)):
    #     error_lut = abs(hls_lut_list[i] - impl_lut_list[i]) / impl_lut_list[i]
    #     error_bram = abs(hls_bram_list[i] - impl_bram_list[i]) / impl_bram_list[i]
    #     error_ff = abs(hls_ff_list[i] - impl_ff_list[i]) / impl_ff_list[i]
    #     error_dsp = abs(hls_dsp_list[i] - impl_dsp_list[i]) / impl_dsp_list[i]
    #     error_lut_list.append(error_lut)
    #     error_bram_list.append(error_bram)
    #     error_ff_list.append(error_ff)
    #     error_dsp_list.append(error_dsp)

    # print('the number of designs is: {}'.format(len(hls_lut_list)))
    # print('bram error: {}'.format(sum(error_bram_list)/len(error_bram_list)))
    # print('dsp error: {}'.format(sum(error_dsp_list)/len(error_dsp_list)))
    # print('ff error: {}'.format(sum(error_ff_list)/len(error_ff_list)))
    # print('lut error: {}'.format(sum(error_lut_list)/len(error_lut_list)))
