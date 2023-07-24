plugins_dir=$HOME/dotfiles/zsh/plugins

if [ ! -d $ZSH_PLUGIN_DIR/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_PLUGIN_DIR/powerlevel10k
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH_PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/dotfiles/zsh/p10k.zsh

zstyle ':completion:*' menu select

[ ! -d $ZSH_COMPLETION_DIR ] && mkdir -p $ZSH_COMPLETION_DIR
fpath=($ZSH_COMPLETION_DIR $fpath)

completions=(
  safebox
  op
  docker
)

# load completion files
for i ("$completions[@]") $i completion zsh > "${ZSH_COMPLETION_DIR}/_$i"

autoload -U compinit; compinit

source $plugins_dir/z/zsh-z.plugin.zsh
source $plugins_dir/git/git.plugin.zsh
source $plugins_dir/github/github.plugin.zsh

