#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 115x35 \
       -e sh -c "pacman -V; echo 'Updatable Package(s):'; \
       pacman -Qu | column; bash; sigdwmblocks 7;" ;;
    2) ;;
    3) notify-send "Pacman Version:" \
       "$(pacman -V | grep -oP 'Pacman v.*')" 
       notify-send "~ $(pacman -Qu | wc -l) updatable package(s)" ;;
    4) sigdwmblocks 7 $1 ;;
    5) sigdwmblocks 7 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/update" ;;
esac
