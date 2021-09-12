#!/bin/sh

#############################################################
# 'date' module for dwmblocks
# 
# Allows switching between different preset
# date formats.
#############################################################

# appearance
icon='\uf073'
color='\x13'
base='\x11'

# switching setup
presets=(
    '+%a %d, %b'       # weekday, day, month  
    '+%d.%m.%y'        # date
    '+%d.%m.%y (%a)'   # date (+ weekday)
)
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index date ${#presets[@]} $1
fi

# final output
get_index date && \
printf "$color$icon $(date "${presets[$index]}")$base"

