echo "Install swayOSD to show volume status"

if ctxos-cmd-missing swayosd-server; then
  ctxos-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
