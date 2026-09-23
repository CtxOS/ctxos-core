#!/usr/bin/env bash

# Fix function key behavior for media keys
# Ensure function keys work as expected on laptops
sudo mkdir -p /etc/modprobe.d/
echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf >/dev/null

# Set keyboard options for better function key handling
mkdir -p ~/.config/hypr/
sed -i '/^kb_options/d' "$HOME/.config/hypr/input.conf" 2>/dev/null || true
