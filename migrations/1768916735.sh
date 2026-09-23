echo "Fix microphone gain and audio mixing on Asus ROG laptops"

source "$CTXOS_PATH/install/config/hardware/asus/fix-mic.sh"
source "$CTXOS_PATH/install/config/hardware/asus/fix-audio-mixer.sh"

if ctxos-hw-asus-rog; then
  ctxos-restart-pipewire
fi
