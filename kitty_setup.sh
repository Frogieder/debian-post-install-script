#/bin/bash

mkdir /home/mopslik/.config/kitty
# echo "include custom.conf" >> /home/mopslik/.config/kitty/kitty.conf
cat ./kitty_config.conf >> /home/mopslik/.config/kitty/custom.conf
echo "Kitty config done"
