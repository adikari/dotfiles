#!/bin/zsh

# display random chuck norris quotes in cowthink

has_command() {
  command -v $1 >/dev/null 2>&1
}

current_dir=$(pwd)

if ! has_command fortune; then
  echo "fortune command is required for chuckcow to run.\n"
fi

if ! has_command cowsay; then
  echo "cowsay command is required for chuckcow to run."
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


