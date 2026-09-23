echo "Add right-click terminal action to waybar ctxos menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && ! grep -A5 '"custom/ctxos"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "ctxos-menu",/a\    "on-click-right": "ctxos-launch-terminal",' "$WAYBAR_CONFIG"
fi
