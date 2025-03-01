#!/bin/bash
#a script to get the cropped image under clock in hyprlock
magick /home/sampath/.config/hypr/hyprlock.png -crop 750x1100+120+20 -level 0,170% /home/sampath/.config/hypr/crop.png
echo /home/sampath/.config/hypr/crop.png
