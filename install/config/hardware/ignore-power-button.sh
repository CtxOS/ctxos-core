#!/usr/bin/env bash

# Ignore power button events to prevent accidental shutdown
# Useful for laptops where the power button may be pressed accidentally
sudo mkdir -p /etc/systemd/system/logind.conf.d/
cat > /etc/systemd/system/logind.conf.d/override.conf <<EOF
[Login]
HandlePowerKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
EOF
sudo systemctl restart systemd-logind
