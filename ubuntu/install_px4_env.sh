sudo apt-get --assume-yes install cmake cmake-qt-gui python-jinja2 python-empy
sudo -H pip install jinja2 catkin_pkg empy numpy toml pyyaml
# install qgroundcontrol
sudo usermod -a -G dialout $USER
sudo apt-get --assume-yes remove modemmanager
sudo apt-get --assume-yes install git curl libsdl2-mixer-2.0-0 libsdl2-image-2.0-0 libsdl2-2.0-0
sudo wget -nc https://s3-us-west-2.amazonaws.com/qgroundcontrol/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage
./QGroundControl.AppImage
