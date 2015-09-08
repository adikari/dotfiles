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

chuckcow() {
  plugin="chucknorris"

  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fortune -a $ZSH/plugins/chucknorris/fortunes | cowsay
  fi
}

chuckcow


