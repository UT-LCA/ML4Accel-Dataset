

from pathlib import Path
import shlex
import shutil
import subprocess


def call_tool(cmd: str, cwd: Path, log_output: bool = True):
    cmd_list = shlex.split(cmd)
    s = subprocess.run(cmd_list, cwd=cwd, capture_output=True, text=True)
    if s.returncode != 0:
        raise RuntimeError(
            f"Command {cmd_list} failed with return code {s.returncode} and error"
            f" message:\n\n{s.stderr}\n\n{s.stdout}"
        )
    if log_output:
        print(s.stdout)

def find_bin_path(cmd: str):
    bin_path = shutil.which(cmd)
    if bin_path is None:
        raise RuntimeError(
            "Could not find `{cmd}` automatically (via which), please specify the `cmd`"
            " path manually."
        )
    return bin_path
