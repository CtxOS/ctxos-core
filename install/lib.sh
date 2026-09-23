#!/usr/bin/env bash

ctxos_repo_root() {
  printf '%s\n' "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}"
}

ctxos_config_root() {
  printf '%s\n' "${CTXOS_CONFIG_DIR:-${HOME}/.config/ctxos}"
}

ctxos_require_arch() {
  if ! command -v pacman >/dev/null 2>&1; then
    echo "CtxOS requires Arch Linux with pacman installed." >&2
    exit 1
  fi
}

ctxos_ensure_pkg() {
  local pkg="$1"
  if ! pacman -Q "$pkg" >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm "$pkg"
  fi
}

ctxos_ensure_dir() {
  mkdir -p "$1"
}

ctxos_link_file() {
  local source="$1"
  local destination="$2"

  ctxos_ensure_dir "$(dirname "$destination")"

  if [[ -e "$destination" || -L "$destination" ]]; then
    local backup="$destination.bak"
    if [[ -e "$backup" || -L "$backup" ]]; then
      rm -rf "$backup"
    fi
    mv "$destination" "$backup"
  fi

  ln -s "$source" "$destination"
}

ctxos_link_dir() {
  local source="$1"
  local destination="$2"

  ctxos_ensure_dir "$(dirname "$destination")"

  if [[ -e "$destination" || -L "$destination" ]]; then
    local backup="$destination.bak"
    if [[ -e "$backup" || -L "$backup" ]]; then
      rm -rf "$backup"
    fi
    mv "$destination" "$backup"
  fi

  ln -s "$source" "$destination"
}
