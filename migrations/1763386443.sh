echo "Uniquely identify terminal apps with custom app-ids using ctxos-launch-tui"

# Replace terminal -e calls with ctxos-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/ctxos-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use ctxos-launch-or-focus with ctxos-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|ctxos-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.ctxos\.Wiremix -e wiremix|ctxos-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
