#!/bin/sh

location='61169'
format='%C,+%t\n%p+rain+at+%w\nS+↑+%S,+S+↓+%s'

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 150x45 -e curl -s wttr.in/$location ;;
    2) ;;
    3) notify-send "Today's Weather:" "$(curl -s wttr.in/$location?format="$format")";;
    4) sigdwmblocks 10 $1 ;;
    5) sigdwmblocks 10 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/weather" ;;
esac
