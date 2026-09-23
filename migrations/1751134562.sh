echo "Ensure all indexes and packages are up to date"

ctxos-update-keyring
ctxos-refresh-pacman
sudo pacman -Syu --noconfirm
