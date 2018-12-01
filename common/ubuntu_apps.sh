sudo apt-get --assume-yes install gdebi aptitude htop ssh caja

# Install samba (For shareing files exchange between PCs)
sudo apt-get --assume-yes install samba cifs-utils samba-common

# Install ternminator
sudo apt-get --assume-yes install terminator
cp ./terminator_config ~/.config/terminator/config -f

# Install ffmped (for camera driver)
sudo apt-get --assume-yes install ffmpeg

sudo apt-get --assume-yes install git gitk
