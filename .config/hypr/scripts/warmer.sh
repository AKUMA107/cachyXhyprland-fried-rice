#!/bin/bash

STATE="$HOME/.config/hypr/scripts/state"
if [ ! -f "$STATE" ]; then
    echo -e "BRIGHT=1\nGAMMA=6500" > "$STATE"
fi
source "$STATE"

# Make the screen 10% warmer
# Warmer = lower color temperature (toward 1500K)
TARGET=1500
DIFF=$((GAMMA - TARGET))
STEP=$((DIFF / 10))
GAMMA=$((GAMMA - STEP))
if [ "$GAMMA" -lt 1500 ]; then GAMMA=1500; fi

# Kill any old gammastep process
pkill -f "gammastep -P" 2>/dev/null

# Start new gammastep in passive mode (background)
gammastep -P -O "$GAMMA" -b "$BRIGHT" &

# Save new state
echo -e "BRIGHT=$BRIGHT\nGAMMA=$GAMMA" > "$STATE"

