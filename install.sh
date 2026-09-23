#!/usr/bin/env bash

# shellcheck disable=SC1090
# Exit immediately if a command exits with a non-zero status
set -euo pipefail

source "${CTXOS_REPO_DIR:-${HOME}/.local/share/ctxos}/install/lib.sh"
repo_dir="$(ctxos_repo_root)"
install_dir="$repo_dir/install"

if [[ ! -d "$install_dir" ]]; then
  echo "CtxOS install directory not found: $install_dir"
  echo "A repo checkout is required before running the install flow."
  exit 1
fi

ctxos_require_arch

# Give people a chance to retry running the installation
trap 'echo "CtxOS installation failed! You can retry by running: source $repo_dir/install.sh"' ERR

ordered_scripts=(
  "1-yay.sh"
  "2-identification.sh"
  "3-terminal.sh"
  "4-config.sh"
  "asdcontrol.sh"
  "backgrounds.sh"
  "bluetooth.sh"
  "desktop.sh"
  "development.sh"
  "docker.sh"
  "fonts.sh"
  "hyprlandia.sh"
  "mimetypes.sh"
  "nvidia.sh"
  "nvim.sh"
  "power.sh"
  "printer.sh"
  "ruby.sh"
  "theme.sh"
  "webapps.sh"
  "xtras.sh"
)

for script_name in "${ordered_scripts[@]}"; do
  script_path="$install_dir/$script_name"
  if [[ ! -f "$script_path" ]]; then
    echo "Skipping missing install script: $script_path"
    continue
  fi

  echo -e "\nRunning installer: $script_path"
  source "$script_path"
done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

if command -v gum >/dev/null 2>&1; then
  gum confirm "Reboot to apply all settings?" && reboot
else
  echo "Reboot to apply all settings, or run: sudo reboot"
fi
