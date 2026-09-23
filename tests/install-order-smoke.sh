#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
install_file="$repo_root/install.sh"

if [[ ! -f "$install_file" ]]; then
  echo "Missing install entrypoint: $install_file" >&2
  exit 1
fi

if ! grep -q 'ordered_scripts=(' "$install_file"; then
  echo "install.sh is missing the ordered_scripts stage list" >&2
  exit 1
fi

for expected in \
  "1-yay.sh" \
  "2-identification.sh" \
  "3-terminal.sh" \
  "4-config.sh" \
  "theme.sh" \
  "xtras.sh"
do
  if ! grep -qF "\"$expected\"" "$install_file"; then
    echo "Missing required install stage: $expected" >&2
    exit 1
  fi
done

echo "Install order smoke test passed."
