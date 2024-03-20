import enum
import json
import os
import shlex
import shutil
import subprocess
import time
from pathlib import Path

import psutil


class CallToolResult(enum.Enum):
    SUCCESS = enum.auto()
    TIMEOUT = enum.auto()
    ERROR = enum.auto()


def call_tool(
    cmd: str,
    cwd: Path,
    shell=False,
    timeout: float | None = None,
    log_output: bool = False,
    raise_on_error: bool = True,
) -> CallToolResult:
    if shell:
        cmd_list = cmd
    else:
        cmd_list = shlex.split(cmd)

    try:
        p = subprocess.Popen(
            cmd_list,
            cwd=cwd,
            # text=True,
            # stderr=subprocess.PIPE,
            # stdout=subprocess.PIPE,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            shell=shell,
        )
        # lock to cpu of current process
        os.sched_setaffinity(p.pid, [psutil.Process().cpu_num()])
        p.wait(timeout=timeout)
    except subprocess.TimeoutExpired:
        # os.killpg(os.getpgid(p.pid), signal.SIGTERM)
        # os.kill(p.pid, signal.SIGTERM)
        process_id = psutil.Process(p.pid)
        children = process_id.children(recursive=True)
        for child in children:
            child.terminate()
        p.terminate()
        return CallToolResult.TIMEOUT

    return_code = p.returncode
    if return_code != 0:
        if raise_on_error:
            raise RuntimeError(
                f"Command {cmd_list} failed with return code {return_code}"
            )
        else:
            return CallToolResult.ERROR

    if log_output:
        print(p.stdout)

    return CallToolResult.SUCCESS


def terminate_process_and_children(pid: int):
    process_id = psutil.Process(pid)
    children = process_id.children(recursive=True)
    for child in children:
        child.terminate()
    process_id.terminate()


def wait_for_files_creation(
    file_paths: list[Path], timeout: float, poll_interval: float = 1
) -> bool:
    if timeout < 0:
        raise ValueError("Timeout must be non-negative")
    if poll_interval < 0:
        raise ValueError("Poll interval must be non-negative")

    start_time = time.time()
    while True:
        files_exsit_list = [file_path.exists() for file_path in file_paths]
        all_files_exist = all(files_exsit_list)

        if all_files_exist:
            return True  # Return True if all files were found

        if time.time() - start_time > timeout:
            return False  # Return False if the timeout is exceeded

        time.sleep(poll_interval)


def find_bin_path(cmd: str):
    bin_path = shutil.which(cmd)
    if bin_path is None:
        raise RuntimeError(
            "Could not find `{cmd}` automatically (via which), please specify the `cmd`"
            " path manually."
        )
    return bin_path


def log_execution_time_to_file(
    design_dir: Path, flow_name: str, t_0: float, t_1: float
):
    dt = t_1 - t_0

    if not design_dir.exists():
        raise RuntimeError(f"Design directory {design_dir} does not exist.")

    execution_time_data_fp = design_dir / "execution_time_data.json"
    if execution_time_data_fp.exists():
        execution_time_data = json.loads(execution_time_data_fp.read_text())
    else:
        execution_time_data = {}
    execution_time_data[flow_name] = {
        "t_start": t_0,
        "t_end": t_1,
        "dt": dt,
        "core": psutil.Process().cpu_num(),
    }
    execution_time_data_fp.write_text(json.dumps(execution_time_data, indent=4))
