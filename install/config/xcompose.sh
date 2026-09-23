# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run ctxos-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.local/share/ctxos/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$CTXOS_USER_NAME"
<Multi_key> <space> <e> : "$CTXOS_USER_EMAIL"
EOF
