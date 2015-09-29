
#Install Broadcom STA Driver (if you need)
mkdir wlan
cd wlan
wget https://launchpad.net/ubuntu/+archive/primary/+files/broadcom-sta-dkms_6.30.223.141-1_all.deb

sudo dpkg -i *.deb
cd ..
rm -rf wlan

#Reboot!
sudo reboot