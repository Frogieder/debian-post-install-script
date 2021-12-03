#/bin/bash

echo "Add contrib and non-free to your sources file"
read -p "Press enter to open it"

sudo nano /etc/apt/sources.list
wait

sudo apt update

sudo apt install linux-headers-amd64

sudo apt install nvidia-detect
nvidia-detect
GREEN='\033[0;32m'
echo
echo -e "${GREEN}Note the recomended package and launch nvidia-install.sh with it as argument"

