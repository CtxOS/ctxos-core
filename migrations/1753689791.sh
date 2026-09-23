echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/ctxos/themes/ristretto ]]; then
  ln -nfs ~/.local/share/ctxos/themes/ristretto ~/.config/ctxos/themes/
fi
