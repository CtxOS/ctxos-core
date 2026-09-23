#!/usr/bin/env bash

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"
ctxos_require_arch

for pkg in \
  wget curl unzip inetutils \
  fd eza fzf ripgrep zoxide bat \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate \
  alacritty bash-completion
 do
  ctxos_ensure_pkg "$pkg"
done
