#!/usr/bin/env bash
# Muzei-Bash install script
# Please do not run as root, it automatically will ask you for permission.

if [ "$(id -u)" == "0" ]
then
  echo "WARNING: If you run the install script as root the cronjob will probably not work for your user."
fi

read -r -p "Install Muzei-Bash? [Y/n] " y_or_n
case $y_or_n in
  [nN][oO]|[nN])      echo "Exiting." ; exit ;;
esac

[ $({ crontab -l; echo "0 * * * * DISPLAY=:0 muzeibash"; } | crontab -) ]

sudo bash << EOF
  cp ./MuzeiBash.sh /usr/bin/muzeibash
  chmod +x /usr/bin/muzeibash
  echo "Muzei-Bash installed."
EOF
