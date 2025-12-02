#!/bin/bash

STATE="$HOME/.config/hypr/scripts/state"
if [ ! -f "$STATE" ]; then
    echo -e "BRIGHT=1\nGAMMA=6500" > "$STATE"
fi
source "$STATE"

# Reduce brightness by 10%
BRIGHT=$(awk -v b="$BRIGHT" 'BEGIN {v=b-0.1; if(v<0.1)v=0.1; print v}')

# Kill any old gammastep process
pkill -f "gammastep -P" 2>/dev/null

# Start new gammastep in passive mode (background)
gammastep -P -O "$GAMMA" -b "$BRIGHT" &

# Save new state
echo -e "BRIGHT=$BRIGHT\nGAMMA=$GAMMA" > "$STATE"

