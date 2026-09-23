echo "Change to openai-codex instead of openai-codex-bin"

if ctxos-pkg-present openai-codex-bin; then
    ctxos-pkg-drop openai-codex-bin
    ctxos-pkg-add openai-codex
fi
