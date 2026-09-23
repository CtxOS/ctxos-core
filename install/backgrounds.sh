#!/usr/bin/env bash

# shellcheck disable=SC1091
repo_root="$(ctxos_repo_root 2>/dev/null || printf '%s\n' "${HOME}/.local/share/ctxos")"
config_root="$(ctxos_config_root 2>/dev/null || printf '%s\n' "${HOME}/.config/ctxos")"
BACKGROUNDS_DIR="$config_root/backgrounds/"

source "$repo_root/install/lib.sh"

BACKGROUNDS_DIR="$(ctxos_config_root)/backgrounds/"

download_background_image() {
  local url="$1"
  local path="$2"
  gum spin --title "Downloading $url as $path..." -- curl -sL -o "$BACKGROUNDS_DIR/$path" "$url"
}

for t in "$repo_root"/themes/*/; do
  [[ -e "$t/backgrounds.sh" ]] && source "$t/backgrounds.sh"
done
