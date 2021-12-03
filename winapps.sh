# /bin/bash

read -r -p "Are you running this script for the first time? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	sudo apt-get install virt-manager
	cd ~/Downloads
	wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
	echo "install Instructions: https://github.com/Fmstrat/winapps/blob/main/docs/KVM.md"
	echo "Windows 10 download: https://www.microsoft.com/en-us/software-download/windows10ISO"
else
	mkdir ~/.config
	mkdir ~/.config/winapps
	cp ./winapps.conf ~/.config/winapps/winapps.conf
	sudo apt-get install -y freerdp2-x11
	git clone https://github.com/Fmstrat/winapps.git
	cd winapps
	./bin/winapps check
	./installer.sh
fi



