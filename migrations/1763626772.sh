echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/ctxos/themes/hackerman ]]; then
  rm -rf ~/.config/ctxos/themes/hackerman
  ln -nfs ~/.local/share/ctxos/themes/hackerman ~/.config/ctxos/themes/
fi
