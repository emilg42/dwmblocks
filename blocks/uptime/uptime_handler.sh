#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 100x50 -e sh -c "last -x | less" ;;
    2) uptime -p | tr -d '\n' | xclip -selection c ;;
    3) notify-send "System Uptime:" "$(uptime -p) ~ since $(uptime --since \
        | awk '{ print $2 }')" ;;
    4) sigdwmblocks 6 $1 ;;
    5) sigdwmblocks 6 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/uptime" ;;
esac
