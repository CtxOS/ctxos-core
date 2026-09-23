#!/usr/bin/env bash

# Fix Apple SPI keyboard on newer MacBooks
# Ensure keyboard firmware is properly loaded
sudo pacman -S --needed --noconfirm apple-input-dkms 2>/dev/null || true

# Configure the SPI keyboard driver
sudo mkdir -p /etc/modprobe.d/
echo "options apple_spi_keymap" | sudo tee /etc/modprobe.d/apple-spi.conf >/dev/null 2>/dev/null || true
