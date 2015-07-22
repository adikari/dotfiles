#/bin/bash

yellow='\033[0;33m'
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

restart_required=false

# update configuration submodules
git submodule init
git submodule update --init --recursive

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

config=$HOME/.config
if [ ! -d $config ]; then
  mkdir $config
fi

mv $config/powerline "$BACKUP_DIR" 2>/dev/null
ln -s $HOME/dotfiles/powerline/powerline-config $config/powerline

# install argparse if not exist
$(python -c "import argparse" 2>/dev/null)
if [ $? -eq 1 ]; then
  echo -e "\n${red}Python argparse not found. Installing...${nc}"
  argparse=argparse-1.2.1
  tmp=/tmp
  [ -d $tmp ] || mkdir $tmp
  cd $tmp
  wget https://argparse.googlecode.com/files/$argparse.tar.gz
  tar xfv $argparse.tar.gz
  cd $argparse
  sudo python setup.py install
  sudo rm -r $tmp/$argparse $tmp/$argparse.tar.gz
  cd $HOME/dotfiles
  echo -e "\n${red}Python argparse successfully installed.${nc}"
fi

echo -e "\n${green}Hurray!!! Dotfiles successfully setup.${nc}\n"

if [ "$restart_required" = true ]; then
  echo -e "${red}You must restart your session in order for configurations to take affect!!!${nc}\n"
fi

