#!/bin/bash

. ./scripts/utils/colors
. ./scripts/utils/backup_dir

scripts=./scripts

# update configuration submodules
git submodule init
git submodule update --init --recursive

source $scripts/link_dotfiles
source $scripts/change_shell

source $scripts/install/fonts

source $scripts/install/python
source $scripts/install/vim
source $scripts/install/argparse
source $scripts/install/cowsay
source $scripts/install/fortune

source $scripts/link_dotfiles
source $scripts/setup_phpcs
source $scripts/setup_powerline

echo -e "\n${green}Hurray!!! Dotfiles successfully setup.${nc}\n"

if [ "$restart_required" = true ]; then
  echo -e "${red}You must restart your session in order for configurations to take affect!!!${nc}\n"
fi

