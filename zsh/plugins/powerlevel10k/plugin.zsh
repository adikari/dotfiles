if [ ! -d $ZSH_PLUGIN_DIR/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_PLUGIN_DIR/powerlevel10k
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH_PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/dotfiles/zsh/plugins/powerlevel10k/p10k.zsh
