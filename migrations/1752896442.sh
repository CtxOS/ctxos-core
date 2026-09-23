echo "Replace volume control GUI with a TUI"

if ctxos-cmd-missing wiremix; then
  ctxos-pkg-add wiremix
  ctxos-pkg-drop pavucontrol
  ctxos-refresh-applications
  ctxos-refresh-waybar
fi
