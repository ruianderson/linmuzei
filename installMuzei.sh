#!/bin/bash
cp ./MuzeiBash.sh ~/bin/
chmod +x ~/bin/MuzeiBash.sh
crontab -l | { cat; echo "0 0 * * * ~/bin/MuzeiBash.sh"; } | crontab -
