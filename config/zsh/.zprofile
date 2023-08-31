[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep Hyprland || exec Hyprland
fi
