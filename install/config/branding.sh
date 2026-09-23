#!/usr/bin/env bash

# Apply CtxOS branding
# Set application icons and desktop branding
mkdir -p ~/.local/share/icons/hicolor/48x48/apps/
cp "$CTXOS_INSTALL/../applications/icons/"*.png ~/.local/share/icons/hicolor/48x48/apps/ 2>/dev/null || true
gtk-update-icon-cache ~/.local/share/icons/hicolor &>/dev/null
