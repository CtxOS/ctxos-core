echo "Show battery status notification on right-click of the waybar battery icon"

if ! grep -q 'ctxos-battery-status' ~/.config/waybar/config.jsonc; then
  sed -i '/"on-click": "ctxos-menu power",/a\    "on-click-right": "notify-send -u low \\"$(ctxos-battery-status)\\"",' ~/.config/waybar/config.jsonc
  ctxos-restart-waybar
fi
