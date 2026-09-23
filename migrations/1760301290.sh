echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/ctxos/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/ctxos/themes/flexoki-light ~/.config/ctxos/themes/
fi
