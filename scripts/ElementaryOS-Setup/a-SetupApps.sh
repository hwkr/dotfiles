#Download Elementary OS from here: 
#http://sourceforge.net/projects/elementaryos/files/stable/

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade


#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable


#Clean-up System
sudo apt-get -y purge -y midori-granite
sudo apt-get -y purge -y noise
sudo apt-get autoremove
sudo apt-get autoclean

#Install File Compression Libs
sudo apt-get -y install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

#Install screenfetch (my elementary-OS special Version)
mkdir screenfetch
cd screenfetch
wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
sudo mv screenfetch-dev /usr/bin/screenfetch
cd ..
rm -rf screenfetch

#make it readable and executable
sudo chmod +rx /usr/bin/screenfetch

#Install DCONF Tools
sudo apt-get install dconf-tools

# # For fresh Nvidia Drivers
sudo add-apt-repository -y ppa:xorg-edgers/ppa
sudo apt-get update && sudo apt-get dist-upgrade

# # For Nvidia Cards
# sudo apt-get -y install nvidia-331

# # For AMD/ATI Cards 
# sudo apt-get -y install fglrx-installer

#Install Ubuntu Restricted Extras
sudo apt-get -y install ubuntu-restricted-extras

#Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#Enable Movie DVD Support
sudo apt-get -y install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

#Install a Firewall Application
sudo apt-get -y install gufw

#Install Elementary OS extras

sudo add-apt-repository -y ppa:mpstark/elementary-tweaks-daily
sudo apt-get update
sudo apt-get -y install elementary-tweaks

#! No support (Yet) for Freya

# sudo apt-add-repository -y ppa:versable/elementary-update
# sudo apt-get update

# sudo apt-get -y install elementary-desktop elementary-tweaks
# sudo apt-get -y install elementary-dark-theme elementary-plastico-theme elementary-whit-e-theme elementary-harvey-theme
# sudo apt-get -y install elementary-elfaenza-icons elementary-nitrux-icons
# sudo apt-get -y install elementary-plank-themes
# sudo apt-get -y install wingpanel-slim indicator-synapse

#Add Fonts

sudo add-apt-repository -y ppa:unit193/sourcecodepro
sudo apt-get update
sudo apt-get -y install fonts-source-code-pro-otf
sudo apt-get -y install fonts-source-code-pro-ttf

# Sets up Pantheon Terminal with the desired attributes

gsettings set org.pantheon.terminal.settings palette '#2d2d2d:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#0091c8:#d3d0c8:#5b5b5b:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#00adef:#f2f0ec'

gsettings set org.pantheon.terminal.settings font 'Source Code Pro'
gsettings set org.pantheon.terminal.settings cursor-color '#00adef'


