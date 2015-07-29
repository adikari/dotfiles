#!/bin/bash

# @TODO: when installing and cd into tmp, save $(pwd) and navigate back

scripts=$HOME/dotfiles/scripts

. $scripts/utils/colors
. $scripts/utils/backup_dir

# update configuration submodules
git submodule init
git submodule update --init --recursive

source $scripts/change_shell
source $scripts/link_dotfiles

source $scripts/install/fonts

source $scripts/install/python
source $scripts/install/vim
source $scripts/install/argparse

source $scripts/setup_phpcs
source $scripts/setup_powerline

echo -e "\n${green}Hurray!!! Dotfiles successfully setup.${nc}\n"

if [ "$restart_required" = true ]; then
  echo -e "${red}You must restart your session in order for configurations to take affect!!!${nc}\n"
  unset restart_required
fi

