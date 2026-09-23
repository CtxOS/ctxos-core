echo "Update fastfetch config with new CtxOS logo"

ctxos-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/ctxos/branding
cp $CTXOS_PATH/icon.txt ~/.config/ctxos/branding/about.txt
