#!/bin/bash
# ~/.config/matugen/hooks/reload-kitty.sh

# Use the 'set-colors' remote control command to update running Kitty instances.
# This keeps all open windows and tabs alive.

# Check if the kitty remote control socket is available (optional but good practice)
if command -v kitty >/dev/null 2>&1; then
    # Reload the colors in all currently running kitty instances
    kitty @ set-colors -a --all ~/.config/kitty/colors.conf
fi
