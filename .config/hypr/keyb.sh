#!/bin/bash

primary_hex=$(grep " on_primary=" .config/hypr/keybcolors.css | cut -d'"' -f2 | sed 's/#//g')

if [ -z "$primary_hex" ]; then
    echo "Error: Could not find primary color in keybcolors.css"
    # Fallback color if something goes wrong
    #primary_hex="ffffff"
fi

asusctl aura static -c "$primary_hex"
echo "$primary_hex"
