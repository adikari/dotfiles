export ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LC_ALL=en_AU.UTF-8
export LANG=en_AU.UTF-8
export TERMINAL=kitty
export EDITOR=nvim

export ZSH_COMPLETION_DIR=$HOME/.zsh_completions
export ZSH_PLUGIN_DIR=$HOME/.zsh_plugins

export GO111MODULE=on
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export LYNX_CFG_PATH="$XDG_CONFIG_HOME"/lynx/lynx.cfg

[ -f $HOME/.cargo/env ] && source "$HOME/.cargo/env"
[ -f $HOME/.rover/env ] && source "$HOME/.rover/env"

# vim:ft=zsh
