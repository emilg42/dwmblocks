#!/bin/sh

#############################################################
# 'traffic' module for dwmblocks
# 
# Displays the network traffic.
# (rx/tx)
#############################################################


# appearance
icon_1='\uf062'
icon_2='\uf063'
color='\x13'
base='\x11'

# setup
presets=1
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index traffic $presets $1
fi

# final output
get_index traffic && \
case $index in
  0)
    up="$(awk '{ printf "%4skB/s", $1 }' $HOME/.wm/dwmblocks/stat/traffic)"
    down="$(awk '{ printf "%4skB/s", $2 }' $HOME/.wm/dwmblocks/stat/traffic)"
esac

printf "$color$icon_1 $up $icon_2 $down$base"
