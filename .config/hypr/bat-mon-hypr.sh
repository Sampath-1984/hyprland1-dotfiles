#!/bin/bash

sys-bat-mon(){
local bat_l="$(cat /sys/class/power_supply/BAT0/capacity)"
local bat_s="$(cat /sys/class/power_supply/BAT0/status)"
	if [[ "$bat_l" -ge 50 ]];
		then
		sleep 18000
#		return 0
	elif [[ "$bat_l" -lt 16 ]] && [ "$bat_s" = Discharging ];
		then
		notify-send "Plug in your PC now. Battery remaining $bat_l%" -t 3000 -e -i battery-empty
#		xmessage "Battery Low. Plug in your PC now." -buttons ""$bat_l"% remaining" -fg white -bg red -timeout 5
#		echo $bat_l $bat_s
#	elif [[ "$bat_l" == 100 ]] && [ "$bat_s" = Discharging ];
#		then 
#		sleep 1200 
#		xmessage "Charger Disconnected" -buttons X -fg white -bg black -timeout 1
	else
		return 0
	fi
}

echo program has started!
while :
do
	sys-bat-mon
	sleep 15
done
