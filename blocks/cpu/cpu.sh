#!/bin/sh

#############################################################
# 'cpu' module for dwmblocks
# 
# Allows switching between different preset formats
# for current cpu (see switch case).
#############################################################

# appearance
icon='\uf2db'
color='\x15'
base='\x11'

# setup
presets=3
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index cpu $presets $1
fi

# final output
get_index cpu && \
case $index in
  0) output="$(printf "%.0f%%%%" $(cat $HOME/.wm/dwmblocks/stat/cpu))" ;; # percentage
  1) output="$(printf "%.1f%%%%" $(cat $HOME/.wm/dwmblocks/stat/cpu))" ;; # percentage (1dec) 
  2) output="$(sensors | awk '/^Package/ { print $4 }')" ;;               # temperature
esac

printf "$color$icon $output$base"