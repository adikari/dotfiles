#!/bin/sh

# color constants
yellow='\033[0;33m'
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

# create backup directory
backup_dir="/tmp/dotfiles_$(date +%Y%m%d)"
bin=/usr/local/bin
dotfiles=$HOME/dotfiles
phpcs=$dotfiles/phpcs/PHP_CodeSniffer
restart_required=false

# create backup
backup() {
  if [ ! -d $backup_dir ]; then
    mkdir "$backup_dir"
    echo -e "${green}Backup directory $backup_dir created.${nc}"
  fi

  if [ -f $1 ]; then
    echo $1
    mv $1 $backup_dir
    echo -e "\n${yellow}$1 is backed up in "$backup_dir".${nc}"
  fi
}

# check if given command is available
has_command() {
  command -v $1 >/dev/null 2>&1
}

# create symlink
link() {
  if ! diff $1 $2 &>/dev/null; then
    backup $2; sudo ln -sf $1 $2 2>/dev/null

    echo -e "\n${green}$2 is successfully linked.${nc}"

    if [ "$2" == "zshrc" ]; then restart_required=true; fi
  fi
}

# install given command if not already exists
introduce() {
  if has_command brew; then
    brew install $1
  elif has_command yum; then
    sudo yum install $1
  elif has_command apt-get; then
    sudo apt-get install $1
  fi
}

# change shell to zsh
change_shell() {
  has_command $1 || introduce $1

  if [ $SHELL != $(which $1) ];then
    echo -e "${yellow}For dotfiles to work, we need to change shell to zsh.${nc}"
    chsh -s $(which $1)
  fi
}

# Run vim-plug's install process.
# Vim starts with just a registry of plugins and the `nocompatible` flag.
install_vim_plugins() {
  vim +PlugClean! +PlugUpdate! +quitall!
}

# update configuration submodules
git submodule init
git submodule update --init --recursive

#change shell to zsh
change_shell zsh

link $dotfiles/zsh/zshrc $HOME/.zshrc
link $dotfiles/vim/vimrc $HOME/.vimrc
link $dotfiles/tmux/tmux.conf $HOME/.tmux.conf
link $dotfiles/git/gitconfig $HOME/.gitconfig

link $phpcs/scripts/phpcs $bin/phpcs
link $phpcs/scripts/phpcbf $bin/phpcbf

install_vim_plugins

echo -e "\n${green}Hurray!!! Dotfiles successfully setup.${nc}\n"

if [ "$restart_required" = true ]; then
   echo -e "${red}You must restart your session in order for configurations to take affect!!!${nc}\n"
fi

