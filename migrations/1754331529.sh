echo "Update Waybar for new CtxOS menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  ctxos-refresh-waybar
fi
