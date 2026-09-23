if [[ $(plymouth-set-default-theme) != "ctxos" ]]; then
  sudo cp -r "$HOME/.local/share/ctxos/default/plymouth" /usr/share/plymouth/themes/ctxos/
  sudo plymouth-set-default-theme ctxos
fi
