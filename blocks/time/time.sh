#!/bin/sh

#############################################################
# 'time' module for dwmblocks
# 
# Allows switching between different preset
# time formats.
#############################################################

# appearance
icon='\uf017'
color='\x12'
base='\x11'

# switching setup
presets=(
    '+%H:%M'        # 24h format (no mins)
    '+%H:%M:%S'     # 24 format
    '+%r'           # 12 format
)
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index time ${#presets[@]} $1
fi

# update date on midnight
if [ "$(date '+%H:%M:%S')" == "00:00:00" ]; then
    sigdwmblocks 2
fi

# final output
get_index time && \
printf "$color$icon $(date "${presets[$index]}")$base"