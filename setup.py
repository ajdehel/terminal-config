import os

TERMCONF_SYMLINK = "~/termconf"
TERMCONF_DIR = os.getcwd()
TERMCONF_ENV = "TERMCONF_PATH"
#create and link conf dir
os.symlink(TERMCONF_DIR, TERMCONF_SYMLINK)
os.putenv(TERMCONF_ENV, TERMCONF_SYMLINK)
#link rc files in conf dir
## bash
os.symlink(f"{TERMCONF_SYMLINK}/bash/.bashrc", "~/.bashrc")
os.symlink(f"{TERMCONF_SYMLINK}/bash/.bash_aliases", "~/.bash_aliases")
## input
os.symlink(f"{TERMCONF_SYMLINK}/bash/.inputrc", "~/.inputrc")
## vim
os.symlink(f"{TERMCONF_SYMLINK}/vim/.vimrc", "~/.vimrc")
# link to ssh config
os.symlink(f"{TERMCONF_SYMLINK}/ssh/config", "~/.ssh/config")
