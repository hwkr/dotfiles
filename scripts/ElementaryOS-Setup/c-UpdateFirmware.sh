
#Install fresh firmware
mkdir firmware
cd firmware

wget https://launchpad.net/ubuntu/+archive/primary/+files/linux-firmware_1.117_all.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/nic-firmware_1.117_all.udeb

sudo dpkg -i *.deb

cd ..
rm -rf firmware

#update initramfs
sudo update-initramfs -k all -u

#Reboot
sudo reboot