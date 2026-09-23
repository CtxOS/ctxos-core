# Install all base packages
mapfile -t packages < <(grep -v '^#' "$CTXOS_INSTALL/ctxos-base.packages" | grep -v '^$')
ctxos-pkg-add "${packages[@]}"
