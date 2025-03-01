#!/bin/bash
#provides a wofi menu for theme switching
source ~/.config/hypr/meta.sh
var=$( ls ~/.config/hypr/mythemes | awk '{print substr($0,1,length($0)-3)}' | wofi --show dmenu --height 230 --width 80 -l 1 -y 10 -x 10 )
#echo $var
#if [ ! -z "$var" ]; then
#	if [ -f ~/.config/hypr/mythemes/$var.sh ]; then
#		hypr_refresh $var
#	fi
#fi
#
if [ ! -z "$var" ] && [ -f ~/.config/hypr/mythemes/$var.sh ]; then
	hypr_refresh $var
fi
