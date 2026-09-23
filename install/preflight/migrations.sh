CTXOS_MIGRATIONS_STATE_PATH=~/.local/state/ctxos/migrations
mkdir -p $CTXOS_MIGRATIONS_STATE_PATH

for file in ~/.local/share/ctxos/migrations/*.sh; do
  touch "$CTXOS_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
