echo "Install socat so we can reactivate internal display when external display is removed"

ctxos-pkg-add socat
uwsm-app -- ctxos-hyprland-monitor-watch &
