#/bin/bash

# update configuration submodules
git submodule init
git submodule update --init --recursive

BACKUP_DIR="/tmp/$(date)"
mkdir "$BACKUP_DIR"

declare -A dotfiles

# list of dotfiles
dotfiles[zshrc]=zsh/zshrc
dotfiles[vimrc]=vim/vimrc
dotfiles[tmux.conf]=tmux/tmux.conf
dotfiles[gitconfig]=git/gitconfig

# load each dotfiles
for i in "${!dotfiles[@]}"; do
  config=~/.$i
  mv $config "$BACKUP_DIR" 2>/dev/null
  ln -s dotfiles/${dotfiles[$i]} $config
done

