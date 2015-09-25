
#if not installed 
#Install the Dynamic Kernel Module Support Framework
sudo apt-get -y install dkms

mkdir kernel
cd kernel

#Install Kernel 3.12.2 on 64 Bit
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202-generic_3.12.2-031202.201311291538_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202_3.12.2-031202.201311291538_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-image-3.12.2-031202-generic_3.12.2-031202.201311291538_amd64.deb

#Install Kernel 3.12.2 on 32 Bit
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202-generic_3.12.2-031202.201311291538_i386.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202_3.12.2-031202.201311291538_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-image-3.12.2-031202-generic_3.12.2-031202.201311291538_i386.deb

sudo dpkg -i *.deb

cd ..
rm -rf kernel

#Reboot
sudo reboot