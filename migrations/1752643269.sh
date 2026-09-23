echo "Add new matte black theme"

if [[ ! -L $HOME/.config/ctxos/themes/matte-black ]]; then
  ln -snf ~/.local/share/ctxos/themes/matte-black ~/.config/ctxos/themes/
fi
