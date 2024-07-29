# enable history
[ ! -d "$XDG_STATE_HOME/zsh" ] && mkdir -p "$XDG_STATE_HOME/zsh"
[ ! -d "$XDG_CACHE_HOME/zsh" ] && mkdir -p "$XDG_CACHE_HOME/zsh"
[ ! -d $ZSH_COMPLETION_DIR ] && mkdir -p $ZSH_COMPLETION_DIR

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/completions.zsh
source $HOME/.config/zsh/plugins.zsh
source $HOME/.config/zsh/functions.zsh

[ -d /opt/homebrew/bin ] && PATH="/opt/homebrew/bin:$PATH"
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:$PATH"
[ -d $HOME/bin ] && PATH="$HOME/bin:$PATH"
[ -d $HOME/local/bin ] && PATH="$HOME/local/bin:$PATH"
[ -d $HOME/.local/bin ] && PATH="$HOME/.local/bin:$PATH"
[ -d $XDG_DATA_HOME/pnpm ] && PATH="$XDG_DATA_HOME/pnpm:$PATH"
[ -d $HOME/.cargo ] && PATH="$HOME/.cargo/bin:$PATH"
[ -d $HOME/go ] && PATH="$HOME/go/bin:$PATH"

# load custom config if there is any
[ -f $HOME/.my_zshrc ] && source $HOME/.my_zshrc

if command -v jenv > /dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# load fnm
[ -x "$(command -v fnm)" ] && eval "$(fnm env --use-on-cd --version-file-strategy recursive)" > /dev/null 2>&1

if command -v fzf > /dev/null 2>&1; then
  zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

  # arch
  zvm_after_init_commands+=('[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh')
  zvm_after_init_commands+=('[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh')
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# vim:ft=zsh

# bun completions
[ -s "/home/subash/.bun/_bun" ] && source "/home/subash/.bun/_bun"
