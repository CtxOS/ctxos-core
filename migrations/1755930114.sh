echo "Add new CtxOS Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/ctxos/config/ctxos.ttf ~/.local/share/fonts/
fc-cache
