#!/usr/bin/env bash

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"
ctxos_require_arch

if ! command -v nvim &>/dev/null; then
  for pkg in nvim luarocks tree-sitter-cli; do
    ctxos_ensure_pkg "$pkg"
  done

  repo_root="$(ctxos_repo_root)"
  nvim_dir="$HOME/.config/nvim"

  # Install LazyVim
  rm -rf "$nvim_dir"
  git clone https://github.com/LazyVim/starter "$nvim_dir"
  cp -R "$repo_root/config/nvim/"* "$nvim_dir/"
  rm -rf "$nvim_dir/.git"
  echo "vim.opt.relativenumber = false" >>"$nvim_dir/lua/config/options.lua"
fi
