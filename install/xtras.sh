#!/usr/bin/env bash

# shellcheck disable=SC1091
source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"

yay -S --noconfirm --needed \
  signal-desktop spotify dropbox-cli zoom \
  obsidian-bin typora libreoffice obs-studio kdenlive \
  pinta xournalpp

# Copy over CtxOS applications
source "$(ctxos_repo_root)/bin/ctxos-sync-applications" || true
