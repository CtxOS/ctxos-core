echo "Add .config/brave-flags.conf by default to ensure Brave runs under Wayland"

if [[ ! -f ~/.config/brave-flags.conf ]]; then
  cp $CTXOS_PATH/config/brave-flags.conf ~/.config/
fi
