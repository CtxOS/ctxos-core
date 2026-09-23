echo "Use CtxOS UWSM session without graphical.target startup wait"

sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$CTXOS_PATH/default/wayland-sessions/ctxos.desktop" /usr/local/share/wayland-sessions/ctxos.desktop

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Session=hyprland-uwsm$/Session=ctxos/' /etc/sddm.conf.d/autologin.conf
fi
