echo "Rename lock screen command in Hypridle config"

if grep -q 'ctxos-lock-screen' ~/.config/hypr/hypridle.conf; then
  sed -i 's/ctxos-lock-screen/ctxos-system-lock/g' ~/.config/hypr/hypridle.conf
  ctxos-restart-hypridle
fi
