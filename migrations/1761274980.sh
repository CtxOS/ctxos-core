echo "Migrate to proper packages for localsend and asdcontrol"

if ctxos-pkg-present localsend-bin; then
  ctxos-pkg-drop localsend-bin
  ctxos-pkg-add localsend
fi

if ctxos-pkg-present asdcontrol-git; then
  ctxos-pkg-drop asdcontrol-git
  ctxos-pkg-add asdcontrol
fi
