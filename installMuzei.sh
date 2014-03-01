#!/usr/bin/env bash
# Muzei-Bash install script

mkdir -p ~/bin
cp ./MuzeiBash.sh ~/bin/
cp ./checkMuzei.sh ~/bin/
chmod +x ~/bin/MuzeiBash.sh
chmod +x ~/bin/checkMuzei.sh
{ crontab -l; echo "0 */1 * * * /home/$(whoami)/bin/checkMuzei.sh"; } | crontab - # checking every hour because not all timezones are the same, also ~/bin would not work at crontabs afaik
echo "Muzei-Bash installed."
