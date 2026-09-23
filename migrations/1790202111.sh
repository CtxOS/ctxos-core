echo "Replace pacman-specific pkg-add with apt-compatible version"

if ! command -v ctxos-pkg-add &>/dev/null; then
  ctxos-pkg-add() {
    if ctxos-pkg-missing "$@"; then
      sudo apt-get update && sudo apt-get install -y --no-install-recommends "$@" || exit 1
    fi

    for pkg in "$@"; do
      if ! dpkg -s "$pkg" &>/dev/null; then
        echo -e "\033[31mError: Package '$pkg' did not install\033[0m" >&2
        exit 1
      fi
    done

    exit 0
  }
fi

if ! command -v ctxos-pkg-missing &>/dev/null; then
  ctxos-pkg-missing() {
    for pkg in "$@"; do
      if ! dpkg -s "$pkg" &>/dev/null; then
        exit 0
      fi
    done
    exit 1
  }
fi