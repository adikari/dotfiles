if [ ! -d $ZSH_PLUGIN_DIR/zsh-vi-mode ]; then
  git clone https://github.com/jeffreytse/zsh-vi-mode.git $ZSH_PLUGIN_DIR/zsh-vi-mode
fi

ZVM_VI_ESCAPE_BINDKEY="jj"

source $ZSH_PLUGIN_DIR/zsh-vi-mode/zsh-vi-mode.zsh

