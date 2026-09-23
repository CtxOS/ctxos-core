#!/usr/bin/env bash

# Setup sudo-less asdcontrol for Apple Display brightness
# Assumes asdcontrol is already installed
if command -v asdcontrol &>/dev/null; then
  echo "$USER ALL=(ALL) NOPASSWD: /usr/local/bin/asdcontrol" | sudo tee /etc/sudoers.d/asdcontrol >/dev/null
  sudo chmod 440 /etc/sudoers.d/asdcontrol
fi
