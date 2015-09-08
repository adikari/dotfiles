#!/bin/zsh

chuckcow() {
  plugin="chucknorris"

  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fortune -a $ZSH/plugins/chucknorris/fortunes | cowsay
  fi
}

chuckcow


