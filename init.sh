#!/bin/bash

. ./scripts/utils/colors

restart_required=false
scripts=./scripts
bin=/usr/local/bin

# update configuration submodules
git submodule init
git submodule update --init --recursive

# install powerline fonts
source $scripts/install/fonts

source $scripts/install/python
source $scripts/install/vim
source $scripts/install/argparse
source $scripts/install/cowsay
source $scripts/install/fortune

BACKUP_DIR="/tmp/dotfiles_$(date +%Y%m%d%H%M%S)"
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
  dotfile=${dotfiles[$i]}

  if ! diff $config $dotfile &>/dev/null; then

    if [ -f $config ]; then
      mv $config "$BACKUP_DIR" 2>/dev/null
      echo -e "\n${yellow}$config is backed up in "$BACKUP_DIR".${nc}"
    fi

    ln -s $HOME/dotfiles/$dotfile $config
    echo -e "\n${green}$dotfile is successfully linked.${nc}"

    if [ "$i" == "zshrc" ]; then restart_required=true; fi
  fi
done

# set up phpcs
phpcs=$HOME/dotfiles/phpcs/PHP_CodeSniffer
ln -s $phpcs/scripts/phpcs $bin/phpcs 2>/dev/null
ln -s $phpcs/scripts/phpcbf $bin/phpcbf 2>/dev/null
echo -e "\n${green}PHPCS is successfully set up.${nc}"

config=$HOME/.config
if [ ! -d $config ]; then
  mkdir $config
fi

mv $config/powerline "$BACKUP_DIR" 2>/dev/null
ln -s $HOME/dotfiles/powerline/powerline-config $config/powerline

echo -e "\n${green}Hurray!!! Dotfiles successfully setup.${nc}\n"

if [ "$restart_required" = true ]; then
  echo -e "${red}You must restart your session in order for configurations to take affect!!!${nc}\n"
fi

