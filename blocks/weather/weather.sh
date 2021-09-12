#!/bin/sh

#############################################################
# 'weather' module for dwmblocks
# 
# Displays the textual condition,
# temperature and percipitation.
#############################################################


# appearance
color='\x15'
base='\x11'

# setup
presets=2
location='61169'
source "$HOME/.wm/dwmblocks/config.sh"

# change format on non-null signal(s)
if [ -n "$1" ]; then
    update_index weather $presets $1
fi



shopt -s nocasematch

get_icon() {
  # finding correct icon
  case "$1" in 
    *"Sun"* | *"Clear"* )
      icon='\uf185' ;;
    
    "Partly cloudy")
      icon='\uf6c4' ;; 

    *"Cloud"* | *"Overcast"* ) 
      icon='\uf0c2' ;;

    "Light rain shower")
      icon='\uf743' ;;

    *"Light rain"* | *"Drizzle"* | *"Patchy"*)
      icon='\uf73d' ;;
    
    *"Rain"* | *"Shower"*)
      icon='\uf740' ;;

    *"Snow"* | *"Sleet"*)
      icon='\uf2dc' ;;

    *"Fog"* | *"Mist"* | *"Haze"* | \
    *"Smoke"* | *"Dust"*)
      icon='\uf75f' ;;

    *"Thunder"*)
      icon='\uf0e7' ;;

    *)
      icon='\uf76b' ;;
  esac
}


# fetch weather data
desc="$(curl -s wttr.in/$location?format="%C")"
temp="$(curl -s wttr.in/$location?format="%t")"
perc="$(curl -s wttr.in/$location?format="%p")"
get_icon "$desc"

# final output
get_index weather && \
case $index in
  0) output="$icon $desc $temp" ;;
  1) output="$icon $temp $perc" ;;
esac

printf "$color$output$base"
