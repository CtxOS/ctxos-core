#!/usr/bin/env bash

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"

repo_root="$(ctxos_repo_root)"

# Copy over CtxOS configs
cp -R "$repo_root/config/"* "$HOME/.config/"

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Use default bashrc from Ctxos
echo "source $repo_root/default/bash/rc" >~/.bashrc

# Login directly as user, rely on disk encryption + hyprlock for security
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification from install inputs
if [[ -n "${CTXOS_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$CTXOS_USER_NAME"
fi

if [[ -n "${CTXOS_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$CTXOS_USER_EMAIL"
fi

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/ctxos/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$CTXOS_USER_NAME"
<Multi_key> <space> <e> : "$CTXOS_USER_EMAIL"
EOF
