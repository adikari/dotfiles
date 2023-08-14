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

(( ${+commands[gh]} )) && gh completion -s zsh > "${ZSH_COMPLETION_DIR}/_gh"

autoload -U compinit; compinit

