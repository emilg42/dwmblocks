#!/bin/sh

todo_file="$HOME/Documents/todo.txt"

case "$1" in
    1) $TERMINAL -hold -title popup -geometry 100x30 \
       -e sh -c "$EDITOR +8 $todo_file; sigdwmblocks 9;" ;;
    2) tail -n+8 $todo_file | xclip -selection c ;;
    3) notify-send "ToDo-List:" "$(tail -n+8 $todo_file)" ;;
    4) sigdwmblocks 9 $1 ;;
    5) sigdwmblocks 9 $1 ;;
    6) $VISUAL "$HOME/.wm/dwmblocks/blocks/todo" ;;
esac
