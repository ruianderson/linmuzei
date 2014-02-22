#!/bin/bash
######Initial stuff######
muzeiDir=~/Pictures/Muzei
mkdir -p $muzeiDir/Wallpaper
cd $muzeiDir

######Get the Muzei JSON and parse it######
curl -o muzei.json 'https://muzeiapi.appspot.com/featured?cachebust=1'
imageUri=`jq '.imageUri' $muzeiDir/muzei.json | sed s/\"//g`
imageFile=`basename $imageUri`
title=`jq '.title' $muzeiDir/muzei.json | sed s/\"//g`
byline=`jq '.byline' $muzeiDir/muzei.json | sed s/\"//g`

######Get the latest wallpaper######
cd Wallpaper
if [ -f $imageFile ];
then
  echo "File $imageFile exists."
else
  echo "File $imageFile does not exist, downloading..."
  curl -O $imageUri
fi

######Set the wallpaper######
if [ "$pidof gnome-settings-daemon)" ]
then
  echo "Gnome-settings-daemons detected, setting wallpaper with gsettings..."
  gsettings set org.gnome.desktop.background picture-uri file://$muzeiDir/Wallpaper/$imageFile
else
  echo "Gnome-settings-daemons not running, setting wallpaper with feh..."
  feh --bg-fill $muzeiDir/Wallpaper/$imageFile
fi

######Send a notification######
cd $muzeiDir
if [ -f MuzeiLogo.png ];
then
  echo "Logo already exists."
else
  echo "Lodo doesn't exist, downloading..."
  curl -O "https://raw.github.com/Feminist-Software-Foundation/Muzei-Bash/master/MuzeiLogo.png"
fi
notify-send "New wallpaper: '$title'" "$byline" -i $muzeiDir/MuzeiLogo.png

######Clean up old wallpapers######
echo "Cleaning up old files..."
find $muzeiDir/Wallpaper -ctime +30 | xargs rm -rf
