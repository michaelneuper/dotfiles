#!/usr/bin/env bash

# Add this script to your wm startup file.
DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q main -c "$DIR"/config.ini &
# polybar -q workspaces &
# polybar -q win-title &
# polybar -q music &
# polybar -q info &
# polybar -q time &
# polybar -q power &
polybar -q mybar &

# IPC settings and test
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-main
echo message >/tmp/ipc-main
