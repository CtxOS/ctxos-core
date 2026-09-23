source $CTXOS_INSTALL/preflight/guard.sh
source $CTXOS_INSTALL/preflight/begin.sh
run_logged $CTXOS_INSTALL/preflight/show-env.sh
run_logged $CTXOS_INSTALL/preflight/pacman.sh
run_logged $CTXOS_INSTALL/preflight/migrations.sh
run_logged $CTXOS_INSTALL/preflight/first-run-mode.sh
run_logged $CTXOS_INSTALL/preflight/disable-mkinitcpio.sh
