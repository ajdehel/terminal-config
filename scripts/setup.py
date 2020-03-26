#!/usr/bin/python3

import os

home = os.getenv("HOME")
user = os.getenv("USER")
termconf_path = f"{home}/.{user}"
TERMCONF_ENV = "TERMCONF_PATH"

#remove any potentially pre-existing configs
for each in [".bashrc", ".bash_aliases", ".inputrc", ".vimrc", ".ssh/config", ".gitconfig"]:
	try:
		os.remove(f"{home}/{each}")
	except FileNotFoundError:
		pass
#create and link conf dir
os.putenv(TERMCONF_ENV, termconf_path)

#link conf files in conf dir

# bash
os.symlink(f"{termconf_path}/bash/home/bashrc", f"{home}/.bashrc")
os.symlink(f"{termconf_path}/bash/home/bash_aliases", f"{home}/.bash_aliases")

# input
os.symlink(f"{termconf_path}/bash/home/inputrc", f"{home}/.inputrc")

# vim
os.symlink(f"{termconf_path}/vim/vimrc", f"{home}/.vimrc")

# git
os.symlink(f"{termconf_path}/git/gitconfig", f"{home}/.gitconfig")

# link to ssh config
os.symlink(f"{termconf_path}/ssh/config", f"{home}/.ssh/config")

