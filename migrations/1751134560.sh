echo "Add UWSM env"

export CTXOS_PATH="$HOME/.local/share/ctxos"
export PATH="$CTXOS_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export CTXOS_PATH=$HOME/.local/share/ctxos
export PATH=$CTXOS_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
ctxos-update-keyring
ctxos-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/ctxos/migrations
touch ~/.local/state/ctxos/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old CtxOS installs
ctxos-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $CTXOS_PATH/migrations/1756060611.sh
touch ~/.local/state/ctxos/migrations/1756060611.sh

bash ctxos-update-perform
