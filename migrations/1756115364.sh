echo "Replace buggy native Zoom client with webapp"

if ctxos-pkg-present zoom; then
  ctxos-pkg-drop zoom
  ctxos-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
