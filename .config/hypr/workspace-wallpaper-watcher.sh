#!/bin/bash
LAST_WS=""

while true; do
    CURRENT_WS=$(hyprctl activewindow | grep 'workspace:' | head -n1 | grep -oP '\(\K[0-9]+(?=\))')
    
    # fallback for empty workspace
    if [[ -z "$CURRENT_WS" ]]; then
        CURRENT_WS=$(hyprctl workspaces -j | jq -r '.[] | select(.monitor=="eDP-1") | .id' | head -n1)
    fi

    if [[ "$CURRENT_WS" != "$LAST_WS" ]]; then
        ~/.config/hypr/change-wallpaper.sh
        LAST_WS="$CURRENT_WS"
    fi

    sleep 1
done

