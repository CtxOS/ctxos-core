#!/usr/bin/env bash

# Fix AMD audio input on F13 laptops
# Add firmware for AMD audio controllers
sudo pacman -S --needed --noconfirm sof-firmware

# Add AMD GPU audio firmware
sudo mkdir -p /etc/modprobe.d/
echo "options snd_hda_intel dmic_detect=0" | sudo tee /etc/modprobe.d/sof-audio.conf >/dev/null
