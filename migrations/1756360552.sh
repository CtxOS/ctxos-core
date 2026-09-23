echo "Move CtxOS Package Repository after Arch core/extra/multilib and remove AUR"

ctxos-refresh-pacman
sudo pacman -Syu --noconfirm
