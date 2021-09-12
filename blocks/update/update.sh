#!/bin/sh

#############################################################
# 'update' module for dwmblocks
# 
# Allows switching between different preset formats
# for ram usage (see switch case).
#############################################################

# appearance
icon='\uf49e'
color='\x12'
base='\x11'

# setup
presets=1
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index update $presets $1
fi

# final output
get_index update && \
case $index in
  0) output="$(pacman -Qu | wc -l)" ;;
esac

printf "$color$icon $output$base"