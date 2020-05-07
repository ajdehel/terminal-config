#!/usr/bin/python3

import os
import pathlib

home = pathlib.Path.home()
user = home.owner()
termconf_path = home.joinpath(f".{user}")

def find_config_files(path):
    config_dirs = path.rglob("home/")
    config_paths = list()
    for path in config_dirs:
        config_paths.extend([config.resolve() for config in path.iterdir()])
    return config_paths

def create_link_dict(config_paths):
    link_dict = dict()
    for link_target in config_paths:
        link_path   = home.joinpath(f".{link_target.name}")
        link_dict[link_path] = link_target
    return link_dict

def clear_symlinks(link_list):
    for link_path in link_list:
        try:
            link_path.unlink()
            print(f"Removed '{link_path}'.")
        except FileNotFoundError:
            pass

def create_symlinks(link_dict):
    """Take link_dict and create a key => value link for each key"""
    clear_symlinks(link_dict.keys())
    for link_path, target in link_dict.items():
        print(f"Link '{str(link_path:<20}' => '{target}'")
        link_path.symlink_to(target)

def main():
    config_paths = find_config_files(termconf_path)
    link_dict    = create_link_dict(config_paths)
    create_symlinks(link_dict)

if "__main__" == __name__:
    main()

