#!/bin/zsh

# display random chuck norris quotes in cowthink

has_command() {
  command -v $1 >/dev/null 2>&1
}

current_dir=$(pwd)

if ! has_command fortune; then
  if has_command brew; then
    brew install fortune
  elif has_command yum; then
    cd /tmp
    wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm -ivh epel-release-6-8.noarch.rpm
    sudo rm -rf epel*
    sudo yum install fortune-mod.x86_64
    cd $current_dir
  elif has_command apt-get; then
    sudo apt-get install fortune
  fi
fi

# installs cow
# to uninstall
# 1. remove /usr/bin/cowsay /usr/bin/cowthink
# 2. remove /usr/local/share/cows

if ! has_command cowsay; then
  cd /tmp
  git clone https://github.com/schacon/cowsay.git
  cd cowsay
  sudo ./install.sh
  sudo rm -rf /tmp/cowsay
  cd $current_dir
fi

chuckcow() {
  plugin="chucknorris"

  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then

    if has_command cowsay && has_command fortune; then
      source $ZSH/plugins/$plugin/$plugin.plugin.zsh
      fortune -a $ZSH/plugins/chucknorris/fortunes | cowsay
    fi
  fi
}

chuckcow


