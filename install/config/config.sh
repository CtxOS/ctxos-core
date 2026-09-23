# Copy over CtxOS configs
mkdir -p ~/.config
cp -R ~/.local/share/ctxos/config/* ~/.config/

# Use default bashrc from CtxOS
cp ~/.local/share/ctxos/default/bashrc ~/.bashrc