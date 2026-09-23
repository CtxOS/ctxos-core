echo "Add flags sourcing to hyprland.conf"

HYPR_CONF=~/.config/hypr/hyprland.conf

source "$CTXOS_PATH/install/config/ctxos-toggles.sh"

if [[ -f $HYPR_CONF ]] && ! grep -q "toggles/hypr/\*\.conf" "$HYPR_CONF"; then
  echo -e "\n# Toggle config flags dynamically\nsource = ~/.local/state/ctxos/toggles/hypr/*.conf" >> "$HYPR_CONF"
fi
