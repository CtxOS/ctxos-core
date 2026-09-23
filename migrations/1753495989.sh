echo "Allow updating of timezone by right-clicking on the clock (or running ctxos-cmd-tzupdate)"

if ctxos-cmd-missing tzupdate; then
  bash "$CTXOS_PATH/install/config/timezones.sh"
  ctxos-refresh-waybar
fi
