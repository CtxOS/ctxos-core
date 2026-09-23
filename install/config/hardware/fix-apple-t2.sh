#!/usr/bin/env bash

# Fix Apple T2 chip devices
# T2 chip requires special handling for camera and secure boot
# Install necessary firmware and drivers
sudo pacman -S --needed --noconfirm apple-rtkit-dkms 2>/dev/null || true

# Configure T2 secure boot workaround
sudo mkdir -p /etc/modprobe.d/
# Disable secure boot enforcement if needed for development
echo "options apple_secureboot disable=1" | sudo tee /etc/modprobe.d/apple-t2.conf >/dev/null 2>/dev/null || true

# Enable rtkit daemon for media key handling
chrootable_systemctl_enable rtkit-daemon.service 2>/dev/null || true
