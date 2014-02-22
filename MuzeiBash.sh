#!/bin/bash
muzeiDir=~/Pictures/Muzei
mkdir -p $muzeiDir/Wallpaper
cd $muzeiDir
curl -o muzei.json 'https://muzeiapi.appspot.com/featured?cachebust=1'
imageUri=`jq '.imageUri' $muzeiDir/muzei.json | sed s/\"//g`
imageFile=`basename $imageUri`
cd Wallpaper
if [ -f $imageFile ];
then
  echo "File $imageFile exists."
else
  echo "File $imageFile does not exist, downloading..."
  curl -O $imageUri
fi
gsettings set org.gnome.desktop.background picture-uri file://$muzeiDir/Wallpaper/$imageFile
cd $muzeiDir
title=`jq '.title' $muzeiDir/muzei.json | sed s/\"//g`
byline=`jq '.byline' $muzeiDir/muzei.json | sed s/\"//g`
if [ -f MuzeiLogo.png ];
then
  echo "Logo already exists."
else
  echo "Lodo doesn't exist, downloading..."
  curl -O "https://raw.github.com/Feminist-Software-Foundation/Muzei-Bash/master/MuzeiLogo.png"
fi
notify-send "New wallpaper: '$title'" "$byline" -i $muzeiDir/MuzeiLogo.png

echo "Cleaning up old files..."
find $muzeiDir/Wallpaper -ctime +30 | xargs rm -rf
