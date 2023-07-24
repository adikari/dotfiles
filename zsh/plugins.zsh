plugins_dir=$HOME/dotfiles/zsh/plugins

## start powerlevel 10k setup
powerlevel10k_dir=$HOME/powerlevel10k
if [ ! -d $powerlevel10k_dir ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $powerlevel10k_dir
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/dotfiles/zsh/p10k.zsh
## end powerlevel 10k setup

completions=(
  safebox
  op
  docker
)

# load completion files
for i ("$completions[@]") $i completion zsh > "${ZSH_COMPLETION_DIR}/_$i"

# initialize zsh completions
autoload -U compinit; compinit

source $plugins_dir/z/zsh-z.plugin.zsh
source $plugins_dir/git/git.plugin.zsh
source $plugins_dir/github/github.plugin.zsh
