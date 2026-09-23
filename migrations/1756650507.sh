echo "Fix JetBrains font setting"

if [[ $(ctxos-font-current) == JetBrains* ]]; then
  ctxos-font-set "JetBrainsMono Nerd Font"
fi
