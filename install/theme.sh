#!/usr/bin/env bash

# shellcheck disable=SC1091
source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"

repo_root="$(ctxos_repo_root)"
config_root="$(ctxos_config_root)"
theme_name="tokyo-night"
theme_dir="$repo_root/themes/$theme_name"

# Use dark mode for QT apps too (like kdenlive)
sudo pacman -S --noconfirm qt5-style-kvantum

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
ctxos_ensure_dir "$config_root/themes"
for theme_path in "$repo_root"/themes/*; do
  [[ -e "$theme_path" ]] || continue
  ctxos_link_file "$theme_path" "$config_root/themes/$(basename "$theme_path")"
done

# Set initial theme
ctxos_ensure_dir "$config_root/current"
ctxos_link_dir "$config_root/themes/$theme_name" "$config_root/current/theme"
source "$theme_dir/backgrounds.sh"
ctxos_ensure_dir "$config_root/backgrounds"
ctxos_link_dir "$config_root/backgrounds/$theme_name" "$config_root/current/backgrounds"
ctxos_link_file "$config_root/current/backgrounds/1-Pawel-Czerwinski-Abstract-Purple-Blue.jpg" "$config_root/current/background"

# Set specific app links for current theme
ctxos_link_file "$config_root/current/theme/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"
ctxos_link_file "$config_root/current/theme/wofi.css" "$HOME/.config/wofi/style.css"
ctxos_link_file "$config_root/current/theme/neovim.lua" "$HOME/.config/nvim/lua/plugins/theme.lua"
mkdir -p ~/.config/btop/themes
ctxos_link_file "$config_root/current/theme/btop.theme" "$HOME/.config/btop/themes/current.theme"
mkdir -p ~/.config/mako
ctxos_link_file "$config_root/current/theme/mako.ini" "$HOME/.config/mako/config"
