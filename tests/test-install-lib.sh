#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source "$(dirname "$0")/../install/lib.sh"

repo_root="$(ctxos_repo_root)"
if [[ "$repo_root" != "$HOME/.local/share/ctxos" ]]; then
  echo "Expected repo root to be $HOME/.local/share/ctxos, got $repo_root" >&2
  exit 1
fi

config_root="$(ctxos_config_root)"
if [[ "$config_root" != "$HOME/.config/ctxos" ]]; then
  echo "Expected config root to be $HOME/.config/ctxos, got $config_root" >&2
  exit 1
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
mkdir -p "$workdir/destination"

# Existing destination file should be backed up before replacement.
printf 'original\n' > "$workdir/link-target"
ctxos_link_file "$workdir/destination/file.txt" "$workdir/link-target"

if [[ ! -L "$workdir/link-target" ]]; then
  echo "Expected link-target to be a symlink" >&2
  exit 1
fi

if [[ ! -f "$workdir/link-target.bak" ]]; then
  echo "Expected original destination file to be preserved as a backup" >&2
  exit 1
fi
