echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/ctxos/themes/ethereal ]]; then
  rm -rf ~/.config/ctxos/themes/ethereal
  ln -nfs ~/.local/share/ctxos/themes/ethereal ~/.config/ctxos/themes/
fi
