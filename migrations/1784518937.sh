echo "Point the Neovim theme symlink at the CtxOS 3.x theme location"

# ctxos-nvim briefly created ~/.config/nvim/lua/plugins/theme.lua linked to
# the CtxOS 4 theme location, which doesn't exist on CtxOS 3.x, so Neovim
# failed to load plugins.theme on startup (#6309). Retarget the link to the
# 3.x location, but leave any customized link alone.
theme_link="$HOME/.config/nvim/lua/plugins/theme.lua"
if [[ -L $theme_link && $(readlink "$theme_link") == *.local/state/ctxos/current/theme/neovim.lua ]]; then
  ln -snf "../../../../.config/ctxos/current/theme/neovim.lua" "$theme_link"
fi
