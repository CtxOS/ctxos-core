echo "Update Waybar screen recording command"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'ctxos-cmd-screenrecord' "$WAYBAR_CONFIG"; then
  sed -i 's/ctxos-cmd-screenrecord/ctxos-capture-screenrecording/g' "$WAYBAR_CONFIG"
  ctxos-restart-waybar
fi
