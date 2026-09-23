echo "Change to ctxos-nvim package"
ctxos-pkg-drop ctxos-lazyvim
ctxos-pkg-add ctxos-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
ctxos-nvim-setup
