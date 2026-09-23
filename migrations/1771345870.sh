echo "Switch lmstudio -> lmstudio-bin"

if pacman -Q lmstudio &>/dev/null; then
  ctxos-pkg-drop lmstudio
  ctxos-pkg-add lmstudio-bin
fi
