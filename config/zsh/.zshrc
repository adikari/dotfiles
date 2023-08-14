export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LC_ALL=en_AU.UTF-8
export LANG=en_AU.UTF-8
export TERMINAL=kitty
# export EDITOR=nvim
export ZSH_COMPLETION_DIR=$HOME/.zsh_completions
export ZSH_PLUGIN_DIR=$HOME/.zsh_plugins

# enable history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# better autocomplete
zstyle ':completion:*' menu select

# load fnm
[ -x "$(command -v fnm)" ] && eval "$(fnm env --use-on-cd --version-file-strategy recursive)" > /dev/null 2>&1

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/completions.zsh
source $HOME/.config/zsh/plugins.zsh

[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:$PATH"
[ -d $HOME/bin ] && PATH="$HOME/bin:$PATH"
[ -d $HOME/local/bin ] && PATH="$HOME/local/bin:$PATH"

# load custom config if there is any
if [ -f $HOME/.my_zshrc ]; then
  source $HOME/.my_zshrc
fi

# add jenv to path
if which jenv > /dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

if [ -d $HOME/go ]; then
  export GO111MODULE=on
  export PATH="$HOME/go/bin:$PATH"
fi

if [ -d $HOME/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which fzf > /dev/null 2>&1; then
  zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

  # arch
  zvm_after_init_commands+=('[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh')
  zvm_after_init_commands+=('[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh')
fi

if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

eval "$(starship init zsh)"

# vim:ft=zsh
