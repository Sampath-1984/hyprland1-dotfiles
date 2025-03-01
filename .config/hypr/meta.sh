#!/bin/bash
# this is an attempt at optimising this switch code.
# this file aims at unifying the switching mech. into one file, sourcing the variables
function hypr_refresh(){
var=$1
source ~/.config/hypr/mythemes/$var.sh
echo $name > /var/tmp/switch.txt &
gsettings set org.gnome.desktop.interface gtk-theme $gtk_theme &
gsettings set org.gnome.desktop.interface icon-theme $icon_theme &
swww img ~/Pictures/Wallpapers/active/$wall.png --transition-type any &
killall waybar && sleep 0.5 &
sleep 0.3 && waybar -s ~/.config/waybar/$waybar.css &
set_fonts &
hypr-dock &
hypr-colors &
alacritty &
hyprctl reload &
killall swaync && sleep 0.5 &
sleep 0.3 && swaync -s ~/.config/swaync/$swaync.css &
swaync-client --reload-config &
swaync-client --reload-style &
sleep 0.8 && cp $(swww query | awk '{print $8'}) ~/.config/hypr/hyprlock.png &
}

function hypr_init(){
var=$1
source ~/.config/hypr/mythemes/$var.sh

swww-daemon &
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize,menu:' &
sleep 0.8 && hypr_refresh $1 &

##waybar
##dock
##swaync
#echo $name > /var/tmp/switch.txt &
##echo \$act.border=$color > ~/.config/hypr/myhyprcolors.conf
##echo \$inact.border=$alt_color >> ~/.config/hypr/myhyprcolors.conf
#set_fonts &
#hypr-dock &
#hypr-colors && hyprctl reload &
#alacritty &
#swww-daemon && sleep 2
#swww img ~/Pictures/Wallpapers/active/$wall.png
##gsettings set org.gnome.desktop.wm.preferences button-layout 'menu:,minimize,maximize,close' &
#gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize,menu:' &
#gsettings set org.gnome.desktop.interface gtk-theme $gtk_theme &
#gsettings set org.gnome.desktop.interface icon-theme $icon_theme &
#sleep 5 && cp $(swww query | awk '{print $8'}) ~/.config/hypr/hyprlock.png &
}

function alacritty(){
echo "[general]" > ~/.alacritty.toml
echo "import = [" >> ~/.alacritty.toml
echo \"~/.config/alacritty/config.toml\", >> ~/.alacritty.toml
echo \"~/.config/alacritty/themes/themes/active/$name.toml\", >> ~/.alacritty.toml
echo "]" >> ~/.alacritty.toml
}

function hypr-colors(){
echo \$act.border=$color > ~/.config/hypr/myhyprcolors.conf
echo \$inact.border=$alt_color >> ~/.config/hypr/myhyprcolors.conf
echo \$shadow.color=$shadow_color >> ~/.config/hypr/myhyprcolors.conf
echo \$act.opacity=$act_opacity >> ~/.config/hypr/myhyprcolors.conf
echo \$inact.opacity=$inact_opacity >> ~/.config/hypr/myhyprcolors.conf
echo \$round=$round >> ~/.config/hypr/myhyprcolors.conf
echo \$shadow.range=$shadow_range >> ~/.config/hypr/myhyprcolors.conf
echo \$shadow.render_power=$shadow_render_power >> ~/.config/hypr/myhyprcolors.conf
echo \$shadow.offset=$shadow_offset >> ~/.config/hypr/myhyprcolors.conf
echo \$fg.color=$fg_color >> ~/.config/hypr/myhyprcolors.conf
echo \$bg.color=$bg_color >> ~/.config/hypr/myhyprcolors.conf
echo \$txt.color=$txt_color >> ~/.config/hypr/myhyprcolors.conf
}

function hypr-dock(){
killall nwg-dock-hyprland
#if [ $name == "macos" ];then
#	sleep 0.3 && nwg-dock-hyprland -i 48 -d -hd 0 -p bottom -c 'wofi --show drun -I -m -W 425' -ico ~/.config/nwg-dock-hyprland/macos-bit-logo.png &
#elif [ $name == "windows" ];then
#	sleep 0.3 && nwg-dock-hyprland -i 38 -x -f -a "start" -lp "start" -hd 0 -p bottom -c 'wofi --show drun -I -W 350 -H 400 -l 7 -x 10 -y -10 --gtk-dark -m' -ico ~/.config/nwg-dock-hyprland/windows-bit-logo.png &
#elif [ $name == "13" ];then
#	sleep 0.3 && nwg-dock-hyprland -i 30 -x -f -a "end" -lp "end" -hd 0 -p left -c 'wofi --show drun -I -W 350 -H 400 -l 7 -x 10 -y -10 -m' -ico edit-find &
#else
	sleep 0.3 && nwg-dock-hyprland -i 33 -d -hd 0 -p right -c 'wofi --show drun -I -m -W 425' -ico edit-find &
#fi
}

function hypr_top(){
lvar=$1
killall nwg-dock-hyprland
killall waybar
sleep 0.3
if [ $lvar == "alt" ];then
	waybar -c ~/.config/waybar/top-config.jsonc -s ~/.config/waybar/opaque-style-top.css &
else
	waybar -c ~/.config/waybar/top-config.jsonc -s ~/.config/waybar/transparent-style.css &
fi
nwg-dock-hyprland -i 33 -d -hd 0 -p bottom -c 'wofi --show drun -I -m -W 425' -ico edit-find &
}

function set_fonts(){
case $name in
"green")
font="Fixedsys62"
size=10
;;
"blue")
font="Colombo"
size=11
;;
"nine")
font="VT323"
size=12
;;
"black")
font="Whois"
size=12
;;
"system")
font="Chicago"
size=9
;;
"vaporwave")
font="07x5"
size=8
;;
"windoze")
font="Segoe UI"
size=9
;;
*)
font="Sans Regular"
size=9
esac
gsettings set org.gnome.desktop.interface font-name "$font $size"
}
