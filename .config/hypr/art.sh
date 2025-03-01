#!/usr/bin/bash
#to-do: sanitize the metadata
stat=$(playerctl status)
url=$(playerctl metadata mpris:artUrl)
artist=$(playerctl metadata artist)
album=$(playerctl metadata album)
metadata=$(printf "$artist - $album")
#metadata=albumart1

#function upscale{
#magick $name -adaptive-resize 200% $name
#magick /home/sampath/.cache/albumart/"metadata".png -filter sinc -adaptive-resize 200% \-unsharp 0x1 /home/sampath/.cache/albumart/"metadata".png
#}

#if [ $url == $no_media ]
if [ $stat == "Stopped" ]
then
    echo /home/sampath/.cache/albumart/no_media.png
#  exit
elif [ -f /home/sampath/.cache/albumart/"$metadata".png ]
then
  echo /home/sampath/.cache/albumart/"$metadata".png
else
  curl -s $url -o /home/sampath/.cache/albumart/"$metadata"
  magick /home/sampath/.cache/albumart/"$metadata" /home/sampath/.cache/albumart/"$metadata".png
  if [[ $(file /home/sampath/.cache/albumart/"$metadata".png | grep -Eo "[[:digit:]]+ *x *[[:digit:]]+" | awk '{{print $1}}') -le 200 ]]
  then 
#    upscale
    mv /home/sampath/.cache/albumart/"$metadata".png /home/sampath/.cache/albumart/tmp.png 
    magick /home/sampath/.cache/albumart/tmp.png -filter sinc -adaptive-resize 200% \-unsharp 0x1 /home/sampath/.cache/albumart/tmp.png
    magick /home/sampath/.cache/albumart/tmp.png -filter lanczos \-unsharp 0x1 /home/sampath/.cache/albumart/fin.png
    mv /home/sampath/.cache/albumart/fin.png /home/sampath/.cache/albumart/"$metadata".png 
    rm /home/sampath/.cache/albumart/tmp.png 
  fi
  rm /home/sampath/.cache/albumart/"$metadata"
  echo /home/sampath/.cache/albumart/"$metadata".png
fi
