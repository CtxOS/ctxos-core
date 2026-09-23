echo "Add sample post-boot hook"

mkdir -p ~/.config/ctxos/hooks/post-boot.d

if [[ ! -f ~/.config/ctxos/hooks/post-boot.d/weather.sample ]]; then
  cp "$CTXOS_PATH/config/ctxos/hooks/post-boot.d/weather.sample" ~/.config/ctxos/hooks/post-boot.d/weather.sample
fi
