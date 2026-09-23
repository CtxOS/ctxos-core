#!/bin/bash

set -e

# Set install mode to online since boot.sh is used for curl installations
export CTXOS_ONLINE_INSTALL=true

ansi_art='                 ▄▄▄
   ██████╗████████╗██╗  ██╗ ██████╗ ███████╗
  ██╔════╝╚══██╔══╝╚██╗██╔╝██╔═══██╗██╔════╝
  ██║        ██║    ╚███╔╝ ██║   ██║███████╗
  ██║        ██║    ██╔██╗ ██║   ██║╚════██║
  ╚██████╗   ██║   ██╔╝ ██╗╚██████╔╝███████║
   ╚═════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

              CtxOS'

clear
echo -e "\n$ansi_art\n"

# Use custom branch if instructed, otherwise default to master
CTXOS_REF="${CTXOS_REF:-master}"

# Set mirror based on branch
if [[ $CTXOS_REF == "dev" ]]; then
  export CTXOS_MIRROR=edge
  echo 'Server = https://mirror.ctxos.org/$repo/os/$arch' | sudo tee /etc/pacman.d/mirrorlist >/dev/null
elif [[ $CTXOS_REF == "rc" ]]; then
  export CTXOS_MIRROR=rc
  echo 'Server = https://rc-mirror.ctxos.org/$repo/os/$arch' | sudo tee /etc/pacman.d/mirrorlist >/dev/null
else
  export CTXOS_MIRROR=stable
  echo 'Server = https://stable-mirror.ctxos.org/$repo/os/$arch' | sudo tee /etc/pacman.d/mirrorlist >/dev/null
fi

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to ctxos/ctxos-core
CTXOS_REPO="${CTXOS_REPO:-ctxos/ctxos-core}"

echo -e "\nCloning CtxOS from: https://github.com/${CTXOS_REPO}.git"
echo -e "\e[32mUsing branch: $CTXOS_REF\e[0m"
rm -rf ~/.local/share/ctxos/
git clone --branch "$CTXOS_REF" "https://github.com/${CTXOS_REPO}.git" ~/.local/share/ctxos >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/ctxos/install.sh
