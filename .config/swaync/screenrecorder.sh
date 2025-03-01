#!/bin/bash
function scr-rec {
var=$(pgrep -x wf-recorder)
if [ ! -z "$var" ]; then
	pkill -x wf-recorder
	pkill -x xmessage
	sleep 3
fi

name=recording_$(date +%F_%T).mp4
wf-recorder -f ~/Videos/Screencasts/"$name" -D --audio=alsa_output.pci-0000_00_14.2.analog-stereo.monitor &
notify-send "Screen recording has started." -i video-display -t 2000 &
echo -e "The screen is being recorded.\nClosing window ends the recording." | xmessage -buttons "Click here to stop recording." -fg white -bg black -file - #-print
#var=$(notify-send "The screen is being recorded." --action=0="Click this to stop recording." -t 800 -i screenshot )
#echo $var
#echo $name
pkill -x wf-recorder
notify-send "The recording is stored in ~/Videos/Screencasts " -i video-display
}

scr-rec
