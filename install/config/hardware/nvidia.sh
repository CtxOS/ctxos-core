#!/usr/bin/env bash

# NVIDIA GPU setup for Hyprland
# Check for NVIDIA GPU and install drivers if present
if lspci | grep -qi 'nvidia'; then
  # Enable multilib for 32-bit graphics support
  if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/^#\[multilib\]/,/^#Include/ s/^#//' /etc/pacman.conf
  fi

  # Determine appropriate driver package
  if lspci | grep -qiE 'RTX [2-9][0-9]|GTX 16'; then
    NVIDIA_DRIVER="nvidia-open-dkms"
  else
    NVIDIA_DRIVER="nvidia-dkms"
  fi

  # Install NVIDIA packages
  yay -S --needed --noconfirm "${NVIDIA_DRIVER}" nvidia-utils lib32-nvidia-utils egl-wayland

  # Configure modprobe for early KMS
  echo "options nvidia_drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf >/dev/null

  # Add NVIDIA environment variables to hyprland.conf
  HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"
  if [ -f "$HYPRLAND_CONF" ]; then
    cat >>"$HYPRLAND_CONF" <<'EOF'

# NVIDIA environment variables
env = NVD_BACKEND,direct
env = LIBVA_DRIVER_NAME,nvidia
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
EOF
  fi
fi
