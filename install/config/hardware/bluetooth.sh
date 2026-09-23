#!/usr/bin/env bash

# Enable Bluetooth and ensure it starts on boot
chrootable_systemctl_enable bluetooth.service

# Ensure Bluetooth is active
sudo systemctl start bluetooth.service
