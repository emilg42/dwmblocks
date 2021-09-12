#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 80x40 -e ncdu $HOME ;;
    2) ;;
    # processes, progress bar
    3) notify-send -h int:value:$(df -h $HOME | tail -n1 | awk '{ print $5 }') \
       "Current Disk Usage:" "$(df -h --output=target,used,size)" ;;
    4) sigdwmblocks 3 $1 ;;
    5) sigdwmblocks 3 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/disk" ;;
esac