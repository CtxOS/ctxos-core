echo "Use interactive unlock (Plymouth) selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $CTXOS_PATH/default/elephant/ctxos_unlocks.lua ~/.config/elephant/menus/ctxos_unlocks.lua
ctxos-restart-walker
