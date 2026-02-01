#!/bin/bash
cd ~/.config/spicetify/Themes/text || exit
python3 color_convert.py
spicetify apply

