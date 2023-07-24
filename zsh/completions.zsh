load_completion() {
  $1 completion zsh > "${ZSH_COMPLETION_DIR}/_$1"
}

load_completion safebox
load_completion op
