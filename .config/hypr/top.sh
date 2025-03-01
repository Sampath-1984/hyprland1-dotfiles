#!/bin/bash
#this script was made to make the current theme vertical centric
#varalt=$1
#var=$(cat /var/tmp/switch.txt)
source ~/.config/hypr/meta.sh
#echo $var
#echo $varalt
#if [ $varalt == "alt" ]; then
#	hypr_left alt
#else
#	hypr_left
#fi
hypr_top $1
