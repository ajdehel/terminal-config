import os

HOME = os.getenv("HOME")
TERMCONF_SYMLINK = f"{HOME}/.termconf"
TERMCONF_DIR = os.getcwd()
TERMCONF_ENV = "TERMCONF_PATH"
#remove any potentially pre-existing configs
for each in [".termconf", ".bashrc", ".bash_aliases", ".inputrc", ".vimrc", ".ssh/config", ".gitconfig"]:
	try:
		os.remove(f"{HOME}/{each}")
	except FileNotFoundError:
		pass
#create and link conf dir
os.symlink(TERMCONF_DIR, TERMCONF_SYMLINK)
os.putenv(TERMCONF_ENV, TERMCONF_SYMLINK)
#link conf files in conf dir
## bash
os.symlink(f"{TERMCONF_SYMLINK}/bash/.bashrc", f"{HOME}/.bashrc")
os.symlink(f"{TERMCONF_SYMLINK}/bash/.bash_aliases", f"{HOME}/.bash_aliases")
## input
os.symlink(f"{TERMCONF_SYMLINK}/bash/.inputrc", f"{HOME}/.inputrc")
## vim
os.symlink(f"{TERMCONF_SYMLINK}/vim/.vimrc", f"{HOME}/.vimrc")
## git
os.symlink(f"{TERMCONF_SYMLINK}/git/.gitconfig", f"{HOME}/.gitconfig")
# link to ssh config
os.symlink(f"{TERMCONF_SYMLINK}/ssh/config", f"{HOME}/.ssh/config")

