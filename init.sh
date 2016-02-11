#!/bin/sh

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
    echo "Backup directory $backup_dir created."
  fi

  if [ -f $1 ]; then
    echo $1
    mv $1 $backup_dir
    echo "$1 is backed up in $backup_dir"
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

    echo "$2 is successfully linked."

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
    echo "For dotfiles to work, we need to change shell to zsh."
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

# install npm packages
npm install

#change shell to zsh
change_shell zsh

link $dotfiles/zsh/zshrc $HOME/.zshrc
link $dotfiles/vim/vimrc $HOME/.vimrc
link $dotfiles/tmux/tmux.conf $HOME/.tmux.conf
link $dotfiles/git/gitconfig $HOME/.gitconfig

link $phpcs/scripts/phpcs $bin/phpcs
link $phpcs/scripts/phpcbf $bin/phpcbf

install_vim_plugins

echo "Hurray!!! Dotfiles successfully setup."

if [ "$restart_required" = true ]; then
   echo "You must restart your session in order for configurations to take affect!!!"
fi

