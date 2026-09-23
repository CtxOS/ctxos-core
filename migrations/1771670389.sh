echo "Add Logout option to system menu"

ctxos-refresh-sddm

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Current=.*/Current=ctxos/' /etc/sddm.conf.d/autologin.conf
fi
