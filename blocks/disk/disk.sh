#!/bin/sh

#############################################################
# 'disk' module for dwmblocks
# 
# Allows switching between different preset formats
# for disk usage (see switch case).
#############################################################

# appearance
icon='\uf0a0'
color='\x14'
base='\x11'

# setup
presets=3
partition='/dev/sdb1'
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index disk $presets $1
fi

# final output
get_index disk && \
case $index in
  0) output="$(df -h "$partition" | tail -n1 \
      | awk '{ print $5 }')%" ;;        # percentage

  1) output="$(df -h "$partition" | tail -n1 \
      | awk '{ print $3 }')" ;;        # absolute

  2) output="$(df -h "$partition" | tail -n1 \
      | awk '{ print $3 "/" $2 }')" ;;  # fraction
esac

printf "$color$icon $output$base"