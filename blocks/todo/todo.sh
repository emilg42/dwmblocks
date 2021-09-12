#!/bin/sh

#############################################################
# 'todo' module for dwmblocks
# 
# Displays amount of left tasks.
#############################################################

# appearance
icon='\uf46c'
color='\x14'
base='\x11'


# setup
presets=1
todo_file="$HOME/Documents/todo.txt"
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index todo $presets $1
fi

# final output
get_index todo && \
case $index in
  0) output="$(grep -Eo '^[0-9])*' $todo_file | wc -l)" ;;
esac

printf "$color$icon $output$base"

