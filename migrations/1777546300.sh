echo "Enable FRED on Intel Panther Lake systems"

DEFAULT_LIMINE="/etc/default/limine"

if ctxos-hw-intel-ptl && [[ -f $DEFAULT_LIMINE ]] && ! grep -q 'fred=on' "$DEFAULT_LIMINE"; then
  source "$CTXOS_PATH/install/config/hardware/intel/fred.sh"

  sudo limine-update
fi
