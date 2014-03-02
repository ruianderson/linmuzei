#!/usr/bin/env bash
# Muzei-Bash install script
# Please do not run as root, it automatically will ask you for permission.

{ crontab -l; echo "0 * * * * checkmuzei"; } | crontab -
sudo bash << EOF
cp ./MuzeiBash.sh /usr/bin/muzeibash
cp ./checkMuzei.sh /usr/bin/checkmuzei
chmod +x /usr/bin/muzeibash
chmod +x /usr/bin/checkmuzei
EOF
echo "Muzei-Bash installed."
