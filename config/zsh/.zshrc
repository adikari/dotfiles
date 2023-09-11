# enable history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# better autocomplete
zstyle ':completion:*' menu select

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/completions.zsh
source $HOME/.config/zsh/plugins.zsh

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

eval "$(starship init zsh)"

# vim:ft=zsh
