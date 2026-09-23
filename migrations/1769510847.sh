echo "Switch back to mainline chromium now that it supports full live theming"

if ctxos-pkg-present ctxos-chromium; then
  if gum confirm "Ready to switch to mainstream chromium? (Will close Chromium + reset settings)"; then
    pkill -x chromium
    ctxos-pkg-drop ctxos-chromium
    ctxos-pkg-add chromium
    ctxos-theme-set-browser
  fi
fi
