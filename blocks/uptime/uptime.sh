#!/bin/sh

#############################################################
# 'uptime' module for dwmblocks
# 
# Allows switching between different preset
# uptime formats.
#############################################################

# appearance
icon='\uf1d8'
color='\x17'
base='\x11'


# switching setup
presets=2
source "$HOME/.wm/dwmblocks/config.sh"


# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index uptime $presets $1
fi


# final output
get_index uptime && \
case $index in
  0) output="$(date -d@$(awk '{ printf "%.0f", $1 }' /proc/uptime) -u +%H:%M)" ;; # hh:mm format
  1) output="$(awk '{ printf "%dmin", $1/60 }' /proc/uptime)" ;;                  # abs minutes
esac    

printf "$color$icon $output$base"

