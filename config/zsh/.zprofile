[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export NNN_FIFO=/tmp/nnn.fifo

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep Hyprland || exec Hyprland
fi
