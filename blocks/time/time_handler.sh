#!/bin/sh

case "$1" in
    1) $BROWSER --new-window https://online-timer.org > /dev/null 2>&1 ;;
    2) date +%s | tr -d '\n' | xclip -selection c ;;
    3) notify-send "Current Time:" "$(date)" ;;
    4) sigdwmblocks 1 $1 ;;
    5) sigdwmblocks 1 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/time" ;;
esac
