#/bin/bash

if [[ $# -eq 0 ]] ; then 
	echo "Please specify driver name"
	exit 1
fi

sudo apt install $1 linux-image-amd64

echo "The machine will now reboot"
read -p "Press enter to continue, Ctrl+C to cancel."
sudo reboot
