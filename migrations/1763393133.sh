echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $CTXOS_PATH/default/elephant/ctxos_themes.lua ~/.config/elephant/menus/ctxos_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
ctxos-restart-walker
