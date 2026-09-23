echo "Add minimal starship prompt to terminal"

if ctxos-cmd-missing starship; then
  ctxos-pkg-add starship
  cp $CTXOS_PATH/config/starship.toml ~/.config/starship.toml
fi
