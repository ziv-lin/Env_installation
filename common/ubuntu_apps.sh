# Install git (for camera driver)
sudo apt-get --assume-yes install git gitk meld 
# configure cccache and colorgcc (PCL speed up compilation): http://pointclouds.org/documentation/advanced/c_cache.php#c-cache
sudo apt-get --assume-yes install ccache colorgcc 


sudo apt-get --assume-yes install gdebi aptitude htop ssh caja

# Install samba (For shareing files exchange between PCs)
sudo apt-get --assume-yes install samba cifs-utils samba-common

# Install ternminator
sudo apt-get --assume-yes install terminator
cp ./terminator_config ~/.config/terminator/config -f

# Install ffmped (for camera driver)
sudo apt-get --assume-yes install ffmpeg

# Install fcitx pinyin
sudo apt-get --assume-yes install fcitx fcitx-googlepinyin im-config

# Install clang
sudo apt-get --assume-yes install clang-format

# Install Qt
sudo add-apt-repository ppa:levi-armstrong/qt-libraries-xenial 
sudo add-apt-repository ppa:levi-armstrong/ppa 
sudo apt-get update && sudo apt-get install qt57creator-plugin-ros
sudo apt-get install -y qt57creator-plugin-ros 
