=> due for an update!
this file was made as an attempt to document the structures, properties and abilities of various files in this directory
this file should contain the following files at all times for the system to function properly DO NOT DELETE ANY OF THESE FILES, AS THEY WON'T BE GENERATED AGAIN!!!
list:
retro.frag            -> this is a shader for hyprland that emulates old crt monitors
*Hyprspace-main        -> this folder contains the files necessary for the hyprspace plugin, that gives an overview of the workspaces and facilitates in switching workspaces or moving a window to a specific workspace
bat-mon.sh            -> a custom script written by me that alerts the user about the low battery level with the help of a notification
hyprland.conf         -> main hyprland config file that contains the information regarding the startup applications, look and feel of windows and window decorations, animations, input device configs. and keybindings and structure of window layouts and workspace rules etc.
hyprlock.conf         -> main config file of the hyprlock applications which is the current lockscreen
hyprlock.png          -> image used by the hyprlock application as the blurred background, should always be a png! 
meta.sh               -> main bash script made by me containing important functions such as hypr_refresh and hypr_init used by the other scripts(refresh.sh, sesh-init.sh and theme-menu.sh)
myhyprcolors.conf     -> colors for hyprland compositor, hyprland.conf sources its colors for the window background and shadows from this file
refresh.sh            -> bash script responsible for refreshing the currently applied theme (kills and rexecutes the waybar, wob, dock and swaync, while reapplying the gtk-theme, icons and wallpaper)(uses hypr_refresh from meta.sh)
sesh-init.sh          -> bash script run at startup, initialises wob and swww-daemon and sets the initial gtk-theme, icon-theme and wallpaper (uses hypr_init from meta.sh)
theme-menu.sh         -> bash script responsible for the theme switcher menu done in wofi (uses the hypr_refresh from meta.sh and passes it the newly chosen theme as its parameter)
mythemes/             -> directory containing all the themes, the meta.sh file uses the files in here as variables to apply the theme
mythemes/theme.sh     -> a bash file containig the values of variables used in the meta.sh file, all the files here follow a set format
modified....
modified again...
