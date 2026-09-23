if [[ -n ${CTXOS_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  ctxos-pkg-add base

  # Configure apt sources
  sudo cp -f ~/.local/share/ctxos/default/pacman/pacman-${CTXOS_MIRROR:-stable}.conf /etc/apt/sources.list.d/ctxos-sources.list

  # Update apt cache
  sudo apt-get update

  # Install ctxos keyring if available
  if [[ -f ~/.local/share/ctxos/default/pacman/ctxos-keyring ]]; then
    sudo cp -f ~/.local/share/ctxos/default/pacman/ctxos-keyring /etc/apt/trusted.g.d/ctxos.gpg
  fi

  # Refresh all repos
  sudo apt-get update
fi