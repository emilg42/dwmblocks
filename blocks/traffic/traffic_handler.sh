#!/bin/sh

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 80x30 -e sh -c \
       "speedtest-cli --version; echo; \
       speedtest-cli | grep --color=auto  'Download\|Upload\|$'" ;;
    2) printf "$(ip -brief address | awk '/UP/ { print $3 }' | cut -d'/' -f1)" | xclip -selection c ;;
    3) notify-send "Local IP:" "$(ip -brief address | awk '/UP/ { print $3 }' | cut -d'/' -f1)"
       notify-send "Public IP:" "$(curl -s ifconfig.me)" ;;
    4) sigdwmblocks 8 $1 ;;
    5) sigdwmblocks 8 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/traffic" ;;
esac