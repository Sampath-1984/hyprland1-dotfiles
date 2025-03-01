#!/bin/bash
#this script was made for reloading or refreshing the currently applies theme
var=$(cat /var/tmp/switch.txt)
source ~/.config/hypr/meta.sh
echo $var
#if [[ $var -eq 0 ]]; then
#	filee=wmaker
#elif [[ $var -eq 1 ]]; then
#	filee=black
#elif [[ $var -eq 2 ]]; then
#	filee=light
#elif [[ $var -eq 3 ]]; then
#	filee=gruvbox
#elif [[ $var -eq 4 ]]; then
#	filee=nordic
#elif [[ $var -eq 5 ]]; then
#	filee=red
#else
#	filee=wmaker
#fi
#echo $filee
if [ -f ~/.config/hypr/mythemes/$var.sh ]; then
	hypr_refresh $var
else 
	#hypr_refresh wmaker
	hypr_refresh monochrome
fi
