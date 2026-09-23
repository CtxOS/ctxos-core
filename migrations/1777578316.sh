echo "Rename screen recording command"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'ctxos-capture-screencording' "$WAYBAR_CONFIG"; then
  sed -i 's/ctxos-capture-screencording/ctxos-capture-screenrecording/g' "$WAYBAR_CONFIG"
  ctxos-restart-waybar
fi
