#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define CtxOS locations
export CTXOS_PATH="$HOME/.local/share/ctxos"
export CTXOS_INSTALL="$CTXOS_PATH/install"
export CTXOS_INSTALL_LOG_FILE="/var/log/ctxos-install.log"
export PATH="$CTXOS_PATH/bin:$PATH"

# Install
source "$CTXOS_INSTALL/helpers/all.sh"
source "$CTXOS_INSTALL/preflight/all.sh"
source "$CTXOS_INSTALL/packaging/all.sh"
source "$CTXOS_INSTALL/config/all.sh"
source "$CTXOS_INSTALL/login/all.sh"
source "$CTXOS_INSTALL/post-install/all.sh"
