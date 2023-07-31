plugins_dir=$HOME/dotfiles/zsh/plugins

source $plugins_dir/z/zsh-z.plugin.zsh
source $plugins_dir/gunstage/gunstage.plugin.zsh
source $plugins_dir/git/git.plugin.zsh
source $plugins_dir/github/github.plugin.zsh
source $plugins_dir/autosuggestions/plugin.zsh
source $plugins_dir/syntax-highlight/plugin.zsh
source $plugins_dir/zsh-vi-mode/plugin.zsh

# load at last after all plugins in case they have output in terminal
source $plugins_dir/powerlevel10k/plugin.zsh
