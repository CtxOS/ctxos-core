abort() {
  echo -e "\e[31mCtxOS install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
}

# Must be a Debian/Ubuntu-based distro
if [[ ! -f /etc/os-release ]]; then
  abort "Debian/Ubuntu-based distro"
fi

# Check we're not running as root
if (( EUID == 0 )); then
  abort "Running as root (not user)"
fi

# Must be x86 only to fully work
if [[ $(uname -m) != "x86_64" ]]; then
  abort "x86_64 CPU"
fi

# Must have secure boot disabled
if bootctl status 2>/dev/null | grep -q 'Secure Boot: enabled'; then
  abort "Secure Boot disabled"
fi

# Must not have Gnome or KDE already install
if dpkg -l gnome-shell &>/dev/null || dpkg -l plasma-desktop &>/dev/null; then
  abort "Fresh + Vanilla install"
fi

# Must have limine installed
command -v limine &>/dev/null || abort "Limine bootloader"

# Must have btrfs root filesystem
[[ $(findmnt -n -o FSTYPE /) = "btrfs" ]] || abort "Btrfs root filesystem"

# Cleared all guards
echo "Guards: OK"