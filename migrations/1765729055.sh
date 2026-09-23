echo "Add emergency entry for Walker"
CONFIG_FILE="$HOME/.config/walker/config.toml"

if [[ -f $CONFIG_FILE ]] && ! grep -q 'command = "ctxos-restart-walker"' "$CONFIG_FILE"; then
    cat >> "$CONFIG_FILE" << 'EOF'

[[emergencies]]
text = "Restart Walker"
command = "ctxos-restart-walker"
EOF
fi
