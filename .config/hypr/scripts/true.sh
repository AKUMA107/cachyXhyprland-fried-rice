#!/bin/bash

STATE="$HOME/.config/hypr/scripts/state"
if [ ! -f "$STATE" ]; then
    echo -e "BRIGHT=1\nGAMMA=6500" > "$STATE"
fi
source "$STATE"

# Move gamma 10% toward neutral (6500K)
TARGET=6500
DIFF=$((TARGET - GAMMA))
STEP=$((DIFF / 10))
GAMMA=$((GAMMA + STEP))

# Kill any old gammastep process
pkill -f "gammastep -P" 2>/dev/null

# Start new gammastep in passive mode (background)
gammastep -P -O "$GAMMA" -b "$BRIGHT" &

# Save new state
echo -e "BRIGHT=$BRIGHT\nGAMMA=$GAMMA" > "$STATE"

