#!/bin/bash
muzeiDir=~/Pictures/Muzei
mkdir -p $muzeiDir
cd $muzeiDir
curl -o muzei.json 'https://muzeiapi.appspot.com/featured?cachebust=1'
imageUri=`jq '.imageUri' $muzeiDir/muzei.json | sed s/\"//g`
imageFile=`basename $imageUri`
if [ -f $imageFile ];
then
   echo "File $imageFile exists."
else
   echo "File $imageFile does not exist, downloading..."
   curl -O $imageUri
fi
gsettings set org.gnome.desktop.background picture-uri file://$muzeiDir/$imageFile
echo "Cleaning up old files..."
find $muzeiDir -type d -ctime +30 | xargs rm -rf
