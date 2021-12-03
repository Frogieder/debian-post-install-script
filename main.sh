#/bin/bash

GREEN='\033[0;32m'

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}


# add another path to PATH
echo "\nPATH='/usr/sbin:$PATH'" >> .bashrc

# install bash alliases
cat ./.bash_alliases >> ~/.bash_alliases

# add apt sources
echo "Add contrib and non-free to your sources file"
read -p "Press enter to open it"

sudo nano /etc/apt/sources.list
wait

# upgrade the distro and install some cool packages
sudo apt update && sudo apt upgrade
sudo apt install python3 kitty curl tree lutris aptitude gimp steam filezilla gparted  openjdk-17-jdk kicad vim minicom nano lmms

# configure default editor
sudo update-alternatives --config editor

# install vscode
echo "${GREEN}Installing Visual studio code"
wget -O "code.deb" https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./code.deb
rm -f code.deb

# fancy shell
echo "${GREEN}Setting up Fancy shell"
wget https://raw.githubusercontent.com/ChrisTitusTech/scripts/master/fancy-bash-promt.sh -O ->> ~/.bashrc

# install brave
echo "${GREEN}Installing Brave"
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# install freeoffice
echo "${GREEN}Installing FreeOffice"
wget -qO - https://shop.softmaker.com/repo/linux-repo-public.key | apt-key add -
sudo echo "deb https://shop.softmaker.com/repo/apt stable non-free" > /etc/apt/sources.list.d/softmaker.list
sudo apt update
sudo apt install softmaker-freeoffice-2021

# install teams
echo "${GREEN}Installing Teams"
wget -O teams.deb https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x41b&culture=sk-sk&country=SK
sudo apt install ./teams.deb
rm -f teams.deb

# install Discord
echo "${GREEN}Installing Discord"
wget -O discord.deb
sudo apt install ./discord.deb
rm -f descord.deb

# install MultiMC
echo "${GREEN}Installing MultiMC"
wget -O multimc.deb https://files.multimc.org/downloads/multimc_1.6-1.deb
sudo apt install ./multimc.deb
rm -f multimc.deb

# install Packet tracer 
echo "${GREEN}Installing Packet Tracer"
wget -O packetTracer.deb https://www.netacad.com/portal/resources/file/71b29477-0abb-4a52-97eb-cc23d5771574
sudo apt install ./packetTracer.deb
rm -f packetTracer.deb

# download Cura and AppImage Launcher (require manual install, I suppose)
echo "${GREEN}Installing AppImage Launcher"
wget -O appimagelauncher.deb https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install appimagelauncher.deb
wget -O Cura.Appimage https://software.ultimaker.com/cura/Ultimaker_Cura-4.12.1.AppImage

# install TruckersMP from pip
echo "${GREEN}Installing TruckersMP"
python3 -m pip install --user truckersmp-cli

# install Legendary
echo "${GREEN}Installing Legendary"
pip install legendary-gl


installFusion() {
	echo "${GREEN}Installing Autodesk Fusion 360"
	sudo apt update && sudo apt-get install software-properties-common zenity xterm
	mkdir -p "$HOME/.wineprefixes/fusion360/INSTALLDIR" && cd "$HOME/.wineprefixes/fusion360/INSTALLDIR" && wget -N https://github.com/cryinkfly/Autodesk-Fusion-360-for-Linux/raw/main/files/scripts/stable-branch/fusion360-setup-wizard.sh && chmod +x fusion360-setup-wizard.sh && bash fusion360-setup-wizard.sh && wait
}

echo "Fusion 360 is a big instalation process, only proceed if you think it's a good idea"
confirm "Do you want to install Fusion 360? [y/N] " && installFusion

echo "This script has finished"
echo "Now you can move onto installing proper Nvidia drivers, Fusion 360 and WinApps"
