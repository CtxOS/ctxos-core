echo "Replace bluetooth GUI with TUI"

ctxos-pkg-add bluetui
ctxos-pkg-drop blueberry

if ! grep -q "ctxos-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/ctxos-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
