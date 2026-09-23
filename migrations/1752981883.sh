echo "Replace wofi with walker as the default launcher"

if ctxos-cmd-missing walker; then
  ctxos-pkg-add walker-bin libqalculate

  ctxos-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/ctxos/config/walker/* ~/.config/walker/
fi
