#!/usr/bin/env bash

# Configure timezone settings
if [[ -f /etc/timezone ]]; then
  sudo timedatectl set-timezone "$(cat /etc/timezone)"
fi
