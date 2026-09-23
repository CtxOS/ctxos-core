echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/ctxos-cmd-tzupdate/ctxos-launch-floating-terminal-with-presentation ctxos-tz-select/g' ~/.config/waybar/config.jsonc
