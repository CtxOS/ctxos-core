#!/usr/bin/env bash

# Fix SSH connection flakiness by keeping connections alive
sudo mkdir -p /etc/ssh/ssh_config.d/
cat > /etc/ssh/ssh_config.d/99-ctxos.conf <<EOF
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
    TCPKeepAlive yes
EOF
