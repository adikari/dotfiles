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

(( ${+commands[gh]} )) && gh completion -s zsh > "${ZSH_COMPLETION_DIR}/_gh"

zstyle ':completion:*' \
  menu select \
  cache-path $XDG_CACHE_HOME/zsh/zcompcache

autoload -U compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

