if [ ! -d $ZSH_PLUGIN_DIR/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_DIR/zsh-autosuggestions
fi

source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# ctrl space to accept suggestion
bindkey '^ ' autosuggest-accept
