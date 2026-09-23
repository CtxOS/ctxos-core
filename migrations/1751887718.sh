echo "Install Impala as new wifi selection TUI"

if ctxos-cmd-missing impala; then
  ctxos-pkg-add impala
  ctxos-refresh-waybar
fi
