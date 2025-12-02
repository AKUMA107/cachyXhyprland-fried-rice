# ~/.config/matugen/hooks/reload-waybar.sh
#!/bin/bash
pkill waybar
waybar & disown

