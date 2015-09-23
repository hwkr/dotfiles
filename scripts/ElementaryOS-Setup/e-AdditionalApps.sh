#Install Apparmor 2.8
sudo add-apt-repository ppa:apparmor-upload/apparmor-2.8
sudo apt-get update && sudo apt-get dist-upgrade


#Install the latest git Version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get -y install git