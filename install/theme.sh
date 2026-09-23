# Use dark mode for QT apps too (like kdenlive)
sudo pacman -S --noconfirm qt5-style-kvantum

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/ctxos/themes
for f in ~/.local/share/ctxos/themes/*; do ln -s "$f" ~/.config/ctxos/themes/; done

# Set initial theme
mkdir -p ~/.config/ctxos/current
ln -snf ~/.config/ctxos/themes/tokyo-night ~/.config/ctxos/current/theme
source ~/.local/share/ctxos/themes/tokyo-night/backgrounds.sh
ln -snf ~/.config/ctxos/backgrounds/tokyo-night ~/.config/ctxos/current/backgrounds
ln -snf ~/.config/ctxos/current/backgrounds/1-Pawel-Czerwinski-Abstract-Purple-Blue.jpg ~/.config/ctxos/current/background

# Set specific app links for current theme
ln -snf ~/.config/ctxos/current/theme/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/ctxos/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/ctxos/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/ctxos/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/ctxos/current/theme/mako.ini ~/.config/mako/config
