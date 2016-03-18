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

# Prompt for yes or no answer
prompt () {
  while true; do
    read -p "$1 (yes/no)" yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

# create symlink
link() {
  if ! diff $1 $2 &>/dev/null; then
    backup $2; sudo ln -sf $1 $2 2>/dev/null

    echo "$2 is successfully linked."

    if [ "$2" == "zshrc" ]; then restart_required=true; fi
  fi
}

# change shell to zsh
change_shell() {
  shell=$(which $1)
  if [ $SHELL != $shell ];then
    echo "For dotfiles to work, we need to change shell to zsh."
    if prompt "Do you want to change shell to zsh?"; then
      chsh -s $shell
    else
      "Please come back when you decide to use zsh shell :("
      exit 1
    fi
  fi
}

# Run vim-plug's install process.
# Vim starts with just a registry of plugins and the `nocompatible` flag.
install_vim_plugins() {
  vim +PlugClean! +PlugUpdate! +quitall!
}

# Check dependencies
check_dependencies() {
  if ! has_command $1; then
    echo "Missing dependency: $1 not found!! "

    if [ "$2" == "required" ];then
      echo "You must install $1 in order to continue."
      exit 1
    else
      echo "$2 will not be available if you continue."
    fi

    if ! prompt "Do you want to continue?"; then
      echo "Please install $1 and try again."
      exit 1
    fi
  fi
}

# check dependencies required
check_dependencies zsh required
check_dependencies cmake "Vim autocomplete" # also check in plugins.vim to not install ycm if cmake doesnt exist
check_dependencies fortune "Fortune quotes" # remove fortune from zsh plugin if no fortune

#change shell to zsh
change_shell zsh

# update configuration submodules
git submodule init
git submodule update --init --recursive

# install npm packages
npm install

link $dotfiles/zsh/zshrc $HOME/.zshrc
link $dotfiles/vim/vimrc $HOME/.vimrc
link $dotfiles/tmux/tmux.conf $HOME/.tmux.conf
link $dotfiles/git/gitconfig $HOME/.gitconfig
link $dotfiles/configs/tern-config $HOME/.tern-config
link $dotfiles/configs/editorconfig $HOME/.editorconfig
link $dotfiles/configs/jshintrc $HOME/.jshintrc

link $phpcs/scripts/phpcs $bin/phpcs
link $phpcs/scripts/phpcbf $bin/phpcbf

install_vim_plugins

echo "Hurray!!! Dotfiles successfully setup."

if [ "$restart_required" = true ]; then
   echo "You must restart your session in order for configurations to take affect!!!"
fi

