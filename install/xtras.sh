yay -S --noconfirm --needed \
  signal-desktop spotify dropbox-cli zoom \
  obsidian-bin typora libreoffice obs-studio kdenlive \
  pinta xournalpp

# Copy over CtxOS applications
source ~/.local/share/ctxos/bin/ctxos-sync-applications || true
