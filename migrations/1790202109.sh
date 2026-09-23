echo "Adapt preflight guards for Debian/Ubuntu-based systems"

if [[ ! -f /etc/os-release ]]; then
  abort "Debian/Ubuntu-based distro"
fi

if (( EUID == 0 )); then
  abort "Running as root (not user)"
fi

if [[ $(uname -m) != "x86_64" ]]; then
  abort "x86_64 CPU"
fi