import argparse
import csv
import os
import xml.etree.ElementTree as ET


#############################################################
def global_info_extract(file_path):
    with open(file_path, "r+") as f:
        lines = f.readlines()

    clk_target = lines[0].split(",")[1].strip()
    clk_estimated = lines[1].split(",")[1].strip()
    clk_uncertainty = lines[2].split(",")[1].strip()
    bram = lines[7].split(",")[1].strip()
    dsp = lines[8].split(",")[1].strip()
    ff = lines[9].split(",")[1].strip()
    lut = lines[10].split(",")[1].strip()
    uram = lines[11].split(",")[1].strip()
    return [clk_target, clk_estimated, clk_uncertainty, bram, dsp, ff, lut]


def cop_info_extract(file_path):
    with open(file_path, "r+") as f:
        lines = f.readlines()

    arith = 0
    logic = 0
    for line in lines:
        line = line.split(",")
        if line[4] == "logic":
            logic = logic + 1
        if line[4] == "arith":
            arith = arith + 1

    # print("cop arith = {}, cop logic = {}".format(arith, logic))
    return [arith, logic]


def rop_info_extract(file_path):
    with open(file_path, "r+") as f:
        lines = f.readlines()

    arith = 0
    logic = 0
    for line in lines:
        line = line.split(",")
        if line[3] == "logic":
            logic = logic + 1
        if line[3] == "arith":
            arith = arith + 1

    return [arith, logic]
    # print("rop arith = {}, rop logic = {}".format(arith, logic))


def port_info_extract(file_path):
    with open(file_path, "r") as f:
        lines = f.readlines()

    num_in = 0
    num_out = 0
    for line in lines:
        line = line.split(",")
        if line[2] == "0":
            num_in = num_in + 1
        if line[2] == "1":
            num_out = num_out + 1

    return [str(num_in) + "x32", str(num_out) + "x32"]
    # print("port input = {}, port output = {}".format(num_in, num_out))


###################################################################
def get_global_info(RSCinfo):
    global_dict = dict()
    for section in RSCinfo.findall("section"):
        if section.get("name") == "Performance Estimates":
            for item in section.findall("item"):
                if item.get("name") == "Timing (ns)":
                    for column in item.iter("column"):
                        if column.get("name") == "ap_clk":
                            timing_list = column.text.split(", ")
                            global_dict["clk_target"] = float(timing_list[0])
                            global_dict["clk_estimated"] = float(timing_list[1])
                            global_dict["clk_uncertainty"] = float(timing_list[2])

                # elif item.get('name') == 'Latency (clock cycles)':
                #     for column in item.iter('column'):
                #         if column.get('name') == '':
                #             latency_list = column.text.split(', ')
                #             global_dict['latency_min'] = int(latency_list[0])
                #             global_dict['latency_max'] = int(latency_list[1])
                #             global_dict['interval_min'] = int(latency_list[2])
                #             global_dict['interval_max'] = int(latency_list[3])

        elif section.get("name") == "Utilization Estimates":
            global_dict["bram"] = 0
            global_dict["dsp"] = 0
            global_dict["ff"] = 0
            global_dict["lut"] = 0
            global_dict["uram"] = 0
            for item in section.findall("item"):
                if item.get("name") == "Summary":
                    for column in item.iter("column"):
                        res_list = column.text.split(", ")
                        if not res_list[0] == "-":
                            global_dict["bram"] += int(res_list[0])
                        if not res_list[1] == "-":
                            global_dict["dsp"] += int(res_list[1])
                        if not res_list[2] == "-":
                            global_dict["ff"] += int(res_list[2])
                        if not res_list[3] == "-":
                            global_dict["lut"] += int(res_list[3])
                        if not res_list[4] == "-":
                            global_dict["uram"] += int(res_list[4])
                    break
    return global_dict


#############################################################
def run_routine(prj_list, prj_dir, kernel_name, csv_file):
    prj_cnt = 0
    # onboard_power_dic =  on_board_extract(prj_dir)
    global_info_dic = {}
    # rop_info_dic = {}
    # cop_info_dic = {}
    # port_info_dic = {}
    for prj_name in prj_list:
        # global_info_file_path = '{}/{}/preprocess/global_dict.csv'.format(prj_dir, prj_name)
        RSC_file = "{}/{}/solution/.autopilot/db/{}.verbose.rpt.xml".format(
            prj_dir, prj_name, kernel_name
        )
        # rop_info_file_path = '{}/{}/preprocess/rop_dict.csv'.format(prj_dir, prj_name)
        # cop_info_file_path = '{}/{}/preprocess/cop_dict.csv'.format(prj_dir, prj_name)
        # port_info_file_path = '{}/{}/preprocess/port_dict.csv'.format(prj_dir, prj_name)
        if os.path.exists(RSC_file):
            RSCinfo = ET.parse(RSC_file).getroot()
            temp_dict = get_global_info(RSCinfo)
            # remove bad designs
            if (
                temp_dict["bram"] > 1824
                or temp_dict["dsp"] > 2520
                or temp_dict["ff"] > 548160
                or temp_dict["lut"] > 274080
            ):
                continue

            global_info_dic[prj_name] = [
                temp_dict["clk_target"],
                temp_dict["clk_estimated"],
                temp_dict["clk_uncertainty"],
                temp_dict["bram"],
                temp_dict["dsp"],
                temp_dict["ff"],
                temp_dict["lut"],
            ]
            # rop_info_dic[prj_name] = rop_info_extract(rop_info_file_path)
            # cop_info_dic[prj_name] = cop_info_extract(cop_info_file_path)
            # port_info_dic[prj_name] = port_info_extract(port_info_file_path)
            prj_cnt = prj_cnt + 1

    file_path = csv_file
    if os.path.exists(file_path):
        os.system("rm " + file_path)

    with open(file_path, "w+", newline="") as f:
        title = [
            "prj",
            "clk_target(ns)",
            "clk_estimated(ns)",
            "clk_uncertainty(ns)",
            "bram",
            "dsp",
            "ff",
            "lut",
            "c_num_arith",
            "c_num_logic",
            "rtl_num_arith",
            "rtl_num_logic",
            "data_input_port(numxbits)",
            "data_output_port(numxbits)",
        ]
        writer = csv.writer(f)
        writer.writerow(title)

        for prj in global_info_dic:
            wr_line = [prj] + global_info_dic[prj]
            writer.writerow(wr_line)

    return prj_cnt


#############################################################
if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="automatic Vivado data collect script", epilog=""
    )
    parser.add_argument(
        "--prj_dir",
        help="directory of Vivado project as input",
        required=True,
        action="store",
    )
    parser.add_argument(
        "--csv_file", required=True, help="output: csv file containing info"
    )
    parser.add_argument(
        "--kernel_name", required=True, help="input:top kernel_name of HLS function"
    )
    args = parser.parse_args()
    kernel_name = args.kernel_name
    csv_file = args.csv_file
    prj_dir = os.getcwd() + "/" + args.prj_dir

    prj_list = sorted(os.walk("{}".format(prj_dir)).__next__()[1])
    prj_cnt = run_routine(prj_list, prj_dir, kernel_name, csv_file)

    print(
        "Finished feature extraction: project num = {} for {}".format(
            prj_cnt, kernel_name
        )
    )
    print(
        "Finished feature extraction: project num = {} for {}".format(
            prj_cnt, kernel_name
        )
    )
