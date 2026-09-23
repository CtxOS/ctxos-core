# Called by CtxOS ISO setup before starting configurator and archinstall

source "$CTXOS_INSTALL/preflight/set-size-vars.sh"
source "$CTXOS_INSTALL/helpers/logo.sh"
source "$CTXOS_INSTALL/preflight/gum.sh"
source "$CTXOS_INSTALL/helpers/tail-log-output.sh"
source "$CTXOS_INSTALL/helpers/trap-errors.sh"

source $CTXOS_INSTALL/helpers/chroot.sh
source $CTXOS_INSTALL/helpers/logo.sh
source $CTXOS_INSTALL/helpers/gum.sh
source $CTXOS_INSTALL/helpers/errors.sh
source $CTXOS_INSTALL/helpers/logging.sh
source $CTXOS_INSTALL/helpers/layout.sh