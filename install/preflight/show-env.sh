# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(CTXOS_CHROOT_INSTALL|CTXOS_ONLINE_INSTALL|CTXOS_USER_NAME|CTXOS_USER_EMAIL|USER|HOME|CTXOS_REPO|CTXOS_REF|CTXOS_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
