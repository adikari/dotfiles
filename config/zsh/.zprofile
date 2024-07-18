[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

NNN_PLUG_DEFAULT='v:imgview;b:nbak;p:preview-tui'
NNN_PLUG="$NNN_PLUG_DEFAULT"

export NNN_PLUG
export NNN_FIFO=/tmp/nnn.fifo

if [[ "$(tty)" = "/dev/tty1" ]] && command -v Hyprland &> /dev/null; then
  pgrep Hyprland || exec Hyprland
fi
