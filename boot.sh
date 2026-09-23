#!/usr/bin/env bash

ascii_art=''

set -euo pipefail

echo -e "\n$ascii_art\n"

if ! command -v pacman >/dev/null 2>&1; then
  echo "CtxOS bootstrapping requires Arch Linux with pacman installed."
  exit 1
fi

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

repo_dir="${CTXOS_REPO_DIR:-$HOME/.local/share/ctxos}"

echo -e "\nCloning CtxOS into $repo_dir..."
rm -rf "$repo_dir"
git clone https://github.com/ctxos/ctxos-core.git "$repo_dir" >/dev/null

# Use custom branch if instructed
if [[ -n "$CTXOS_REF" ]]; then
  echo -e "\eUsing branch: $CTXOS_REF"
  cd "$repo_dir"
  git fetch origin "${CTXOS_REF}" && git checkout "${CTXOS_REF}"
  cd -
fi

echo -e "\nBootstrap complete."
echo -e "Next step: cd $repo_dir && make install"

if [[ "${CTXOS_RUN_INSTALL:-0}" == "1" ]]; then
  echo -e "\nRunning install flow..."
  source "$repo_dir/install.sh"
fi
