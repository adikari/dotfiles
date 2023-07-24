plugins_dir=$HOME/dotfiles/zsh/plugins

[ ! -d $ZSH_COMPLETION_DIR ] && mkdir -p $ZSH_COMPLETION_DIR
fpath=($ZSH_COMPLETION_DIR $fpath)

completions=(
  safebox
  op
  docker
)

# load completion files
for i ("$completions[@]"); do 
  (( ${+commands[$i]} )) && $i completion zsh > "${ZSH_COMPLETION_DIR}/_$i"
done

autoload -U compinit; compinit

source $plugins_dir/z/zsh-z.plugin.zsh
source $plugins_dir/git/git.plugin.zsh
source $plugins_dir/github/github.plugin.zsh
source $plugins_dir/autosuggestions/plugin.zsh
source $plugins_dir/syntax-highlight/plugin.zsh
source $plugins_dir/zsh-vi-mode/plugin.zsh

# load at last after all plugins in case they have output in terminal
source $plugins_dir/powerlevel10k/plugin.zsh
