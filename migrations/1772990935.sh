echo "Add sample low battery notification hook"

mkdir -p ~/.config/ctxos/hooks/battery-low.d

if [[ ! -f ~/.config/ctxos/hooks/battery-low.d/play-warning-sound.sample ]]; then
  cp "$CTXOS_PATH/config/ctxos/hooks/battery-low.d/play-warning-sound.sample" ~/.config/ctxos/hooks/battery-low.d/play-warning-sound.sample
fi
