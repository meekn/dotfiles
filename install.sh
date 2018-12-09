#!/usr/bin/env sh
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE:-$0}")"; pwd)"
ln -sf ${script_dir}/.inputrc ~
ln -sf ${script_dir}/.screenrc ~
ln -sf ${script_dir}/.tmux.conf ~
ln -sf ${script_dir}/.profile ~
ln -sf ${script_dir}/.bashrc ~
ln -sf ${script_dir}/.zshrc ~
ln -sf ${script_dir}/.zshenv ~
ln -sf ${script_dir}/.emacs.d ~