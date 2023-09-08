ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LC_ALL=en_AU.UTF-8
export LANG=en_AU.UTF-8
export TERMINAL=kitty
export EDITOR=nvim

export LYNX_CFG_PATH="$XDG_CONFIG_HOME"/lynx/lynx.cfg

if [ -f $HOME/.cargo/env ]; then
  . "$HOME/.cargo/env"
fi

[ -f $HOME/.rover/env ] && source "$HOME/.rover/env"

# vim:ft=zsh
