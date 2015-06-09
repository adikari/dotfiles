#/bin/bash

git submodule init
git submodule update --init --recursive

BACKUP_DIR="/tmp/$(date)"
mkdir "$BACKUP_DIR"

mv ~/.zshrc "$BACKUP_DIR"
ln -s dotfiles/zsh/zshrc ~/.zshrc

mv ~/.vimrc "$BACKUP_DIR"
ln -s dotfiles/vim/vimrc ~/.vimrc

mv ~/.tmux.conf "$BACKUP_DIR"
ln -s dotfiles/tmux/tmux.conf ~/.tmux.conf
