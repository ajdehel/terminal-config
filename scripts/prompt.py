#!/usr/bin/python3

################################################################################

import os
import pathlib
import subprocess
import re

################################################################################

MAX_PARENT_LEN = 40
HOME = pathlib.Path.home().expanduser()
ROOT = pathlib.Path(HOME.root)

################################################################################

#===============================================================================
def main():
    line     = get_line()
    pwd      = get_pwd()
    user     = get_user()
    host     = get_hostname()
    shlvl    = get_shlvl()
    git_info = get_git_info()
    prompt_string = f"{line}[{user}@{host}]{{{shlvl}}} {pwd} {git_info}"
    print(prompt_string)

#===============================================================================
def get_line():
    columns = os.get_terminal_size().columns
    line = "".join([ "_" for i_ in range(columns)])
    line += "\n\n"
    return line

#===============================================================================
def get_pwd():
    pwd = pathlib.Path.cwd()
    try:
        is_home = pwd == HOME
        reference = ROOT if is_home else HOME
        pwd    = pwd.relative_to(reference)
        prefix = "" if is_home else "~"
    except ValueError:
        pwd    = pwd.relative_to(ROOT)
        prefix = ""
    path_str   = str(pwd)
    path_len = len(path_str)
    if path_len > MAX_PARENT_LEN:
        parent_parts = pwd.parent.parts
        max_len = max(MAX_PARENT_LEN // len(parent_parts), 1)
        shortened = [ parent[0:max_len] for parent in parent_parts ]
        shortened.append(pwd.name)
        path_str = "/".join(shortened)
    return f"{prefix}/{path_str}"

#===============================================================================
def get_user():
    return os.getenv("USER")

#===============================================================================
def get_hostname():
    hostname = open("/proc/sys/kernel/hostname", "r").read().strip()
    return hostname

#===============================================================================
def get_shlvl():
    return os.getenv("SHLVL")

#===============================================================================
def get_git_info():
    command     = "git status".split()
    proc_status = subprocess.run(command,
                                 stdout=subprocess.PIPE,
                                 stderr=subprocess.DEVNULL)
    if proc_status.returncode != 0:
        return ""
    output = str(proc_status.stdout)
    match = re.search(r"On branch (?P<branch>\w[\w\-_]+)", output)
    branch = match.group(1) if match else ""
    status = dict()
    status["S"]  = bool(re.search(r"Changes to be committed:", output))
    status["US"] = bool(re.search(r"Changes not staged for commit:", output))
    status["UT"] = bool(re.search(r"Untracked files:", output))
    statuses  = [ key for key,value in status.items() if value is True ]
    status_string = ":".join(statuses) if statuses else "C"
    return f"({branch}){{{status_string}}}"

################################################################################
if "__main__" == __name__:
    main()
