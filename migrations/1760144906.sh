echo "Change ctxos-screenrecord to use gpu-screen-recorder"
ctxos-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
ctxos-pkg-add slurp gpu-screen-recorder
