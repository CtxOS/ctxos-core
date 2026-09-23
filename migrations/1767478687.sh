echo "Add opencode with system theming"

ctxos-pkg-add opencode

# Add config using ctxos theme by default
if [[ ! -f ~/.config/opencode/opencode.json ]]; then
  mkdir -p ~/.config/opencode
  cp $CTXOS_PATH/config/opencode/opencode.json ~/.config/opencode/opencode.json
fi
