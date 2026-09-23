echo "Add Catppuccin Latte light theme"

if [[ ! -L $HOME/.config/ctxos/themes/catppuccin-latte ]]; then
  ln -snf ~/.local/share/ctxos/themes/catppuccin-latte ~/.config/ctxos/themes/
fi
