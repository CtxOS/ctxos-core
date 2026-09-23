#!/usr/bin/env bash

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"
ctxos_require_arch

for pkg in \
  brightnessctl playerctl pamixer pavucontrol wireplumber \
  fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool \
  wl-clip-persist clipse-bin \
  nautilus sushi ffmpegthumbnailer gnome-calculator \
  1password-beta 1password-cli \
  chromium mpv \
  evince imv \
  localsend-bin
 do
  ctxos_ensure_pkg "$pkg"
done
