#!/bin/bash

# 1. Search the file for the line starting with "primary="
# 2. Use sed to strip everything except the hex code
primary_hex=$(grep " on_primary=" .config/hypr/keybcolors.css | cut -d'"' -f2 | sed 's/#//g')

# 3. Check if we actually got a value, then apply it
if [ -z "$primary_hex" ]; then
    echo "Error: Could not find primary color in keybcolors.css"
    # Fallback color if something goes wrong
    #primary_hex="ffffff"
fi

asusctl aura static -c "$primary_hex"
echo "$primary_hex"
