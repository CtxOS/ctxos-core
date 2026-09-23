#!/usr/bin/env bash

# Fix Broadcom BCM4360 WiFi on Apple devices
# Install the appropriate firmware and drivers
sudo pacman -S --needed --noconfirm broadcom-wl-dkms

# Load the b43 module
sudo modprobe wl 2>/dev/null || true

# Ensure the module loads at boot
echo "wl" | sudo tee /etc/modules-load.d/broadcom.conf >/dev/null
