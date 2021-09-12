#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 150x50 -e htop -s PERCENT_MEM ;;
    2) ;;
    # processes, progress bar
    3) notify-send -h int:value:$(free -m | awk '/^Mem/ { printf "%d", $3/$2 * 100 }') \
       "Current RAM Usage:" "$(ps axch -o cmd:20,%mem --sort=-%mem | head)" ;;
    4) sigdwmblocks 5 $1 ;;
    5) sigdwmblocks 5 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/ram" ;;
esac
