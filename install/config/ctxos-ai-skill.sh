# Place in each assistant's global skills directory so the CtxOS skill is available on first install
mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$CTXOS_PATH/default/ctxos-skill" ~/.agents/skills/ctxos
ln -sfn "$CTXOS_PATH/default/ctxos-skill" ~/.claude/skills/ctxos
ln -sfn "$CTXOS_PATH/default/ctxos-skill" ~/.codex/skills/ctxos
ln -sfn "$CTXOS_PATH/default/ctxos-skill" ~/.pi/agent/skills/ctxos
