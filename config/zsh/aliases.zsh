alias \
  ss="sudo su -" \
  tmux="tmux -2" \
  fucking=sudo \
  av=aws-vault \
  ave="aws-vault exec" \
  vim='nvim' \
  vi="nvim" \
  pn="pnpm" \
  lf="nnn -e" \
  hyp="Hyprland" \
  mutt="neomutt" \
  cat="bat" \
  vpn="openvpn" \
  lynx="lynx -cfg=$XDG_CONFIG_HOME/lynx/lynx.cfg -lss=$XDG_CONFIG_HOME/lynx/lynx.lss" \
  abook="abook --config "$XDG_CONFIG_HOME"/abook/abookrc --datafile "$XDG_DATA_HOME"/abook/addressbook" \
  ikhal="ikhal -l ~/.local/var/khal/ikhal.log" \
  notes="cat ~/note | glow" \
  aws-koba-playground='aws-google-auth -p koba-playground; export AWS_PROFILE=koba-playground;' \
  aws-koba-dev='aws-google-auth -p koba-dev; export AWS_PROFILE=koba-dev;'

command -v xdg-open &> /dev/null && alias open="xdg-open"
