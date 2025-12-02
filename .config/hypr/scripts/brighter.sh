#!/bin/bash

STATE="$HOME/.config/hypr/scripts/state"
if [ ! -f "$STATE" ]; then
    echo -e "BRIGHT=1\nGAMMA=6500" > "$STATE"
fi
source "$STATE"

# Increase brightness by 10%
BRIGHT=$(awk -v b="$BRIGHT" 'BEGIN {v=b+0.1; if(v>1)v=1; print v}')

# Kill any old gammastep process to avoid duplicates
pkill -f "gammastep -P" 2>/dev/null

# Start gammastep in passive mode (background) so change persists
gammastep -P -O "$GAMMA" -b "$BRIGHT" &

# Save new state
echo -e "BRIGHT=$BRIGHT\nGAMMA=$GAMMA" > "$STATE"

