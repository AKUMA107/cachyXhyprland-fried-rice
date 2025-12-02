#!/bin/bash

# Define the path to your wallpaper change script
WALLPAPER_SCRIPT="$HOME/.config/hypr/change-wallpaper.sh"

# Start the event listener
hyprctl event stream | while read line; do
    # Check if the event line contains 'workspace'
    if [[ "$line" == "workspace"* ]]; then
        # When a workspace event occurs, execute your script.
        # Running it in the background (&) ensures the listener keeps running
        # even if your wallpaper script takes time.
        "$WALLPAPER_SCRIPT" &
    fi
done
