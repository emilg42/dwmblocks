#!/bin/sh

echo "exec" >> /home/emil/Downloads/log.txt

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 68x34 -e cal -ym ;;
    2) date +%d.%m.%y | tr -d '\n' | xclip -selection c ;;
    3) notify-send "$(date "+%B %Y")" "$(cal -m --color=always | \
       sed "s/..7m/<b><span color=\"#a54242\">/;s/..27m/<\/span><\/b>/" | tail -n+2)" ;;
    4) sigdwmblocks 2 $1 ;;
    5) sigdwmblocks 2 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/date" ;;
esac
