ascii_art=''

echo -e "\n$ascii_art\n"

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Ctxos..."
rm -rf ~/.local/share/ctxos/
git clone https://github.com/ctxos/ctxos-core.git ~/.local/share/ctxos >/dev/null

# Use custom branch if instructed
if [[ -n "$CTXOS_REF" ]]; then
  echo -e "\eUsing branch: $CTXOS_REF"
  cd ~/.local/share/ctxos
  git fetch origin "${CTXOS_REF}" && git checkout "${CTXOS_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/ctxos/install.sh
