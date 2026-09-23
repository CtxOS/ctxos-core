#!/usr/bin/env bash

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"
ctxos_require_arch

ctxos_ensure_pkg base-devel

if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  cd /tmp/yay-bin || exit
  makepkg -si --noconfirm
  cd "$HOME" || exit
  rm -rf /tmp/yay-bin
fi
