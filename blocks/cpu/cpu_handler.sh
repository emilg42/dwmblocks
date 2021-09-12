#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 150x50 -e htop -s PERCENT_CPU ;;
    2) ;;
    # cpu name, processes, stats
    3) notify-send "$(lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p')" \
       "$(ps axch -o cmd:25,%cpu --sort=-%cpu | head)"
       notify-send "$(mpstat | tail -n+3 \
            | awk '{ printf "%-7s %-7s %-7s %-7s\n", $4, $6, $8, $13 }')" ;;
    4) sigdwmblocks 4 $1 ;;
    5) sigdwmblocks 4 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/cpu" ;;
esac