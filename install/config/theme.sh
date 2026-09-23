#!/usr/bin/env bash

# Apply CtxOS theme configuration
run_logged "$CTXOS_INSTALL/config/theme.sh"

# Set default theme if not already set
if [[ ! -L "$HOME/.config/ctxos/current/theme" ]]; then
  ln -s "$CTXOS_INSTALL/../themes/tokyo-night" "$HOME/.config/ctxos/current/theme"
fi
