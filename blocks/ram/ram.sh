#!/bin/sh

#############################################################
# 'ram' module for dwmblocks
# 
# Allows switching between different preset formats
# for ram usage (see switch case).
#############################################################

# appearance
icon='\uf538'
color='\x16'
base='\x11'

# setup
presets=3
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index ram $presets $1
fi

# final output
get_index ram && \
case $index in
  0) output="$(free -m | awk '/^Mem/ { printf "%d%%%%", $3/$2 * 100 }')" ;;   # percentage
  1) output="$(free -m | awk '/^Mem/ { printf "%.1f%%%%", $3/$2 * 100 }')" ;; # percentage (1dec)
  2) output="$(free -mh | awk '/^Mem/ { printf "%sB", $3 }')" ;;              # absolute
esac

printf "$color$icon $output$base"