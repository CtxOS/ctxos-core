echo "Update apt sources and keyring for CtxOS installation"

if [[ -n ${CTXOS_ONLINE_INSTALL:-} ]]; then
  ctxos-pkg-add base

  sudo cp -f "$CTXOS_PATH/default/pacman/pacman-stable.conf" /etc/apt/sources.list.d/ctxos-sources.list

  sudo apt-get update

  if [[ -f "$CTXOS_PATH/default/pacman/ctxos-keyring" ]]; then
    sudo cp -f "$CTXOS_PATH/default/pacman/ctxos-keyring" /etc/apt/trusted.g.d/ctxos.gpg
  fi

  sudo apt-get update
fi