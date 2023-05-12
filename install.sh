#!/usr/bin/env sh

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE:-$0}")"; pwd)"
dotfiles_dir="${script_dir}/dotfiles"

mkdir -p ~/.config/git && ln -sf "${dotfiles_dir}/.config/git/ignore" ~/.config/git
ln -sf "${dotfiles_dir}/.inputrc" ~
ln -sf "${dotfiles_dir}/.screenrc" ~
ln -sf "${dotfiles_dir}/.tmux.conf" ~
ln -sf "${dotfiles_dir}/.profile" ~
ln -sf "${dotfiles_dir}/.bashrc" ~
ln -sf "${dotfiles_dir}/.zshrc" ~
ln -sf "${dotfiles_dir}/.zshenv" ~
