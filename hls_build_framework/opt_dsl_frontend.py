import hashlib
import itertools
import json
import random
import time
from pathlib import Path

import psutil

from hls_build_framework.framework import Design, Frontend
from hls_build_framework.utils import log_execution_time_to_file


class ArrayPartition:
    # the first line as the input array_settings
    def __init__(self, array_settings):
        setting_lists = array_settings.split(",")
        self.num_of_directives = int(setting_lists[1])
        self.factors = setting_lists[2].strip("[]").split()
        self.arr_types = setting_lists[3].strip("[]").split()
        # lines are actual templates to wrtie to tcl files
        self.directives = []

    def get_flattened(self):
        output = []
        for factor in self.factors:
            for array_type in self.arr_types:
                output.append([factor, array_type])
        return output

    def get_num_of_directives(self):
        return self.num_of_directives

    def append_directives(self, line):
        self.directives.append(line)

    def get_directives(self):
        return self.directives


class LoopOpt:
    def __init__(self, loop_settings):
        self.num_of_parameters = int(loop_settings.split(",")[1])
        self.num_of_directives = int(loop_settings.split(",")[2])
        # lines are actual templates to wrtie to tcl files
        self.directives = []
        # factors/parameters for the tcl files in strings
        self.parameter_lines = []

    def get_flattened(self):
        output = []
        for line in self.parameter_lines:
            loop_name = line.split(",")[1]
            loop_pipeline = (
                True if (line.split(",")[2].strip() == "pipeline") else False
            )
            loop_unroll = True if (line.split(",")[3].strip() == "unroll") else False
            unroll_factor_lists = line.split(",")[4].strip("[]").split()
            unroll_factor_lists = [x.strip("[]") for x in unroll_factor_lists]
            for unroll_factor in unroll_factor_lists:
                output.append([loop_name, loop_pipeline, loop_unroll, unroll_factor])
        return output

    def append_parameters(self, line):
        self.parameter_lines.append(line)

    def append_directives(self, line):
        self.directives.append(line)

    def get_directives(self):
        return self.directives

    def get_num_of_parameters(self):
        return self.num_of_parameters

    def get_num_of_directives(self):
        return self.num_of_directives


#################################################
def parse_template(
    src_template: Path,
) -> tuple[list[ArrayPartition], list[LoopOpt], str]:
    array_partition_object_lists: list[ArrayPartition] = []
    loop_opt_object_lists: list[LoopOpt] = []
    static_lines = str()

    lines = src_template.read_text().splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.strip().startswith("#") or line.rstrip() == "":
            i += 1
            continue

        if line.strip().startswith("array_partition"):
            array_partition_object = ArrayPartition(line.strip())
            for x in range(array_partition_object.get_num_of_directives()):
                i += 1
                array_partition_object.append_directives(lines[i])
            array_partition_object_lists.append(array_partition_object)
            i += 1
            continue

        if line.strip().startswith("loop_opt"):
            loop_opt_object = LoopOpt(line.strip())
            for x in range(loop_opt_object.get_num_of_parameters()):
                i += 1
                loop_opt_object.append_parameters(lines[i])

            for x in range(loop_opt_object.get_num_of_directives()):
                i += 1
                loop_opt_object.append_directives(lines[i])

            loop_opt_object_lists.append(loop_opt_object)

            i += 1
            continue

        static_lines += line + "\n"
        i += 1

    return array_partition_object_lists, loop_opt_object_lists, static_lines


def gen_opt(array_partition_object_lists, loop_opt_object_lists):
    array_partition_lines = []
    for array_partition_object in array_partition_object_lists:
        directive_lines = array_partition_object.get_directives()
        array_block_lines = []
        for array_settings in array_partition_object.get_flattened():
            # factor is 1, no need to set directives
            if array_settings[0].strip() == "1":
                array_block_lines.append("")
                continue

            output_line = str()
            for line in directive_lines:
                temp_line = line.replace("[factor]", array_settings[0])
                temp_line = temp_line.replace("[type]", array_settings[1])
                # output_line = output_line + temp_line
                output_line += temp_line + "\n"

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
        # by default, nothing to apply to the unroll and pipeline
        loop_opt_block = []
        loop_opt_block.append("")
        for loop_opt_settings in loop_opt_object.get_flattened():
            output_line = str()
            # need to pipeline
            if loop_opt_settings[1] is True:
                for line in directive_pipeline_lines:
                    temp_line = line.replace("[name]", loop_opt_settings[0])
                    output_line += temp_line + "\n"

            # need to unroll
            if loop_opt_settings[2] is True:
                for line in directive_unroll_lines:
                    temp_line = line.replace("[factor]", loop_opt_settings[3])
                    temp_line = temp_line.replace("[name]", loop_opt_settings[0])
                    output_line += temp_line + "\n"

            loop_opt_block.append(output_line)

        loop_opt_lines.append(loop_opt_block)
    loop_opt_lines = list(itertools.product(*loop_opt_lines))
    return array_partition_lines, loop_opt_lines


def generate_opt_sources(
    array_partition_lines,
    loop_opt_lines,
    static_lines,
    random_sample=False,
    random_sample_num=10,
    random_sample_seed=42,
) -> list[str]:
    line_combos_all = list(itertools.product(array_partition_lines, loop_opt_lines))
    if random_sample:
        random.seed(random_sample_seed)
        if random_sample_num > len(line_combos_all):
            random_sample_num = len(line_combos_all)
        line_combos_all = random.sample(line_combos_all, random_sample_num)
    else:
        line_combos_all = line_combos_all

    opt_tcl_sources: list[str] = []
    for a_line, l_line in line_combos_all:
        opt_tcl_source = ""
        opt_tcl_source += static_lines + "\n"
        for x in a_line:
            opt_tcl_source += x + "\n"
        for x in l_line:
            opt_tcl_source += x + "\n"
        opt_tcl_sources.append(opt_tcl_source)

    return opt_tcl_sources


# def generate_opt_tcl(
#     output_path: Path, array_partition_lines, loop_opt_lines, static_lines
# ):
#     # write opt.tcl files
#     num_of_generated_tcls = 0
#     for a_line in array_partition_lines:
#         for l_line in loop_opt_lines:
#             num_of_generated_tcls += 1
#             # output_dir = "{}/{}".format(output_path, num_of_generated_tcls)
#             output_dir = output_path / f"{num_of_generated_tcls}"
#             # if os.path.isdir(output_dir) == False:  # noqa: E712
#             #     os.mkdir(output_dir)
#             if not output_dir.exists():
#                 output_dir.mkdir()
#             # output_file = "{}/opt.tcl".format(output_dir)
#             output_file = output_dir / "opt.tcl"
#             # f = open(output_file, "w+")
#             with open(output_file, "w+") as f:
#                 f.write(static_lines)
#                 f.write("\n")

#                 for x in a_line:
#                     f.write(x)
#                     f.write("\n")

#                 for x in l_line:
#                     f.write(x)
#                     f.write("\n")
#             # f.close()


#############################################################
# if __name__ == "__main__":
#     parser = argparse.ArgumentParser(
#         description="Generate opt tcl scritps to automatically run HLS design",
#         epilog="",
#     )
#     parser.add_argument(
#         "--opt_template", required=True, help="source opt template files as the input"
#     )
#     parser.add_argument(
#         "--output_path",
#         required=True,
#         help="the path to store the opt files, the path need to exsits already",
#     )
#     parser.add_argument(
#         "--hls_template", required=True, help="the src template hls file as the input"
#     )
#     args = parser.parse_args()
#     src_hls = args.hls_template
#     src_template = args.opt_template
#     output_path = args.output_path

#     assert os.path.isdir(output_path), f"the output_path: {output_path} does not exsit"
#     assert os.path.exists(src_hls), f"the src_hls: {src_hls} does not exsit"
#     array_partition_object_lists, loop_opt_object_lists, static_lines = parse_template(
#         src_template
#     )
#     array_partition_lines, loop_opt_lines = gen_opt(
#         array_partition_object_lists, loop_opt_object_lists
#     )
#     num_of_generated_tcls = generate_tcl(
#         src_hls, output_path, array_partition_lines, loop_opt_lines, static_lines
#     )

#     print("{} tcls generated".format(num_of_generated_tcls))
#     # print(static_lines)


class OptDSLFrontend(Frontend):
    name = "OptDSLFrontend"

    def __init__(
        self,
        work_dir: Path,
        random_sample=False,
        random_sample_num=10,
        random_sample_seed=42,
        log_execution_time=True,
    ):
        self.work_dir = work_dir
        self.random_sample = random_sample
        self.random_sample_num = random_sample_num
        self.random_sample_seed = random_sample_seed
        self.log_execution_time = log_execution_time

    def execute(self, design: Design, timeout: float | None = None) -> list[Design]:
        t_0 = time.perf_counter()

        opt_template_fp = design.dir / "opt_template.tcl"

        (
            array_partition_object_lists,
            loop_opt_object_lists,
            static_lines,
        ) = parse_template(opt_template_fp)
        array_partition_lines, loop_opt_lines = gen_opt(
            array_partition_object_lists, loop_opt_object_lists
        )

        opt_sources = generate_opt_sources(
            array_partition_lines,
            loop_opt_lines,
            static_lines,
            self.random_sample,
            self.random_sample_num,
            self.random_sample_seed,
        )

        new_designs = []
        for opt_source in opt_sources:
            opt_source_hash = hashlib.md5(opt_source.encode()).hexdigest()
            new_design = design.copy_and_rename_to_new_parent_dir(
                f"{design.name}_opt_{opt_source_hash}", design.dir.parent
            )
            opt_fp = new_design.dir / "opt.tcl"
            opt_fp.write_text(opt_source)
            new_designs.append(new_design)

            t_1 = time.perf_counter()
            if self.log_execution_time:
                log_execution_time_to_file(new_design.dir, self.name, t_0, t_1)

        t_1 = time.perf_counter()
        if self.log_execution_time:
            log_execution_time_to_file(design.dir, self.name, t_0, t_1)

        return new_designs


class OptDSLPassthroughFrontend(Frontend):
    name = "OptDSLPassthroughFrontend"

    def __init__(
        self,
        work_dir: Path,
    ):
        self.work_dir = work_dir

    def execute(self, design: Design, timeout: float | None = None) -> list[Design]:
        t_0 = time.perf_counter()

        new_designs = []

        new_design = design.copy_and_rename_to_new_parent_dir(
            f"{design.name}_opt_passthrough", design.dir.parent
        )
        opt_fp = new_design.dir / "opt.tcl"
        opt_fp.write_text("")
        new_designs.append(new_design)

        t_1 = time.perf_counter()
        log_execution_time_to_file(new_design.dir, self.name, t_0, t_1)
        log_execution_time_to_file(design.dir, self.name, t_0, t_1)

        return new_designs
