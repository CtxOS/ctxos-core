echo "Use interactive background selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $CTXOS_PATH/default/elephant/ctxos_background_selector.lua ~/.config/elephant/menus/ctxos_background_selector.lua
ctxos-restart-walker
