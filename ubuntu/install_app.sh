#!/bin/bash
###################################################
# -- Install Apps for tx2:
#	Git
#	Vim
#	Terminator
#	Python=3.5
#	Tensorflow
#	QT5
#	Kdevelop
#	Ros (kinetic 1.12.13)
#
###################################################

export IF_VIM=1		# Set 1 to install vim and vim's plug-in
export IF_PYTHON=0	# Set 1 to install recommand python version
export IF_QT=1		# Set 1 to install Qt5
export IF_TENSORFLOW=0	# Set 1 to install python-tensorflow (ATTENTION!!! this would cost a lot of time!!!)
export IF_ROS=1		# Set 1 to install ROS
export IF_SET_GIT=1	# Set 1 to settup my profile
export PYTHON_MAJOR_VERSION=3.6
export PYTHON_MINJOR_VERSION=5 
export PYTHON_VERSION=${PYTHON_MAJOR_VERSION}.${PYTHON_MINJOR_VERSION} #Install python version= 3.6.5

###################################################
if [ $IF_ROS -eq 1 ]; then
	echo "====== --------- ======"
	echo "====== setup ROS ======"
	echo "====== --------- ======"
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
	sudo apt-get update
	sudo apt-get --assume-yes install ros-kinetic-desktop-full
	sudo rosdep init
	rosdep update
	echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
	source ~/.bashrc
	sudo apt-get --assume-yes install python-rosinstall
	sudo apt-get --assume-yes install ros-kinetic-turtlebot*
fi

###################################################
if [ $IF_PYTHON -eq 1 ];then
	echo "You are going to install python ${PYTHON_VERSION}"
fi

if [ $IF_SET_GIT -eq 1 ];then
	export GIT_USER_NAME="ziv.lin"
	export GIT_USER_EMAIL="ziv.lin.ljr@gmail.com"
	echo "User name = ${GIT_USER_NAME}"
	echo "User emai = ${GIT_USER_EMAIL}"
fi

###################################################
echo "====== --------- ======"
echo "====== Install apps ======"
echo "====== --------- ======"

sudo ../common/ubuntu_apps.sh

###################################################
echo "====== --------- ======"
echo "====== setup git ======"
echo "====== --------- ======"
sudo apt-get --assume-yes install git gitk
if [ $IF_SET_GIT -eq 1 ]; then
	echo "Setup git..."
	git config --global --unset http.proxy 
	git config --global --unset https.prox
	git config --global user.name ${GIT_USER_NAME}
	git config --global user.email ${GIT_USER_EMAIL}
        cp ssh_config/*  ~/.ssh/
        echo "Finish"
fi

###################################################
if [ $IF_VIM -eq 1 ]; then
	echo "====== --------- ======"
	echo "====== setup vim ======"
	echo "====== --------- ======"
	sudo apt-get --assume-yes install vim
	./install_vim.sh
fi

###################################################
if [ $IF_QT -eq 1 ]; then
	echo "====== --------- ======"
	echo "====== Install Qt ======"
	echo "====== --------- ======"
	sudo apt-get --assume-yes install qt5-default qtbase5-dev qt5-doc qtcreator
	sudo apt-get --assume-yes install kdevelop
fi
###################################################
if [ $IF_PYTHON -eq 1 ]; then
	echo "====== ------------------------ ======"
	echo "====== setup python environment ======"
	echo "====== ------------------------ ======"

	sudo apt-get --assume-yes install build-essential checkinstall
	sudo apt-get --assume-yes install libreadline-gplv2-dev  libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
	sudo wget -nc https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
	sudo tar xzf Python-${PYTHON_VERSION}.tgz
	cd Python-${PYTHON_VERSION}
	sudo ./configure --enable-optimizations
	sudo make altinstall
	sudo mv /usr/bin/python /usr/bin/python_bak_before_${PYTHON_MAJOR_VERSION}	# Backup system's python
	sudo ln -s /usr/local/bin/python${PYTHON_MAJOR_VERSION} /usr/bin/python	# setup python3.5 as default
	sudo mv /usr/local/bin/pip /usr/local/bin/pip_bak_before_${PYTHON_MAJOR_VERSION}		# Backup system's pip
	sudo ln -s /usr/local/bin/pip${PYTHON_MAJOR_VERSION} /usr/local/bin/pip		# setup pip3.5 as default
	sudo pip install --upgrade pip
	if [ $IF_TENSORFLOW -eq 1 ];then
		sudo wget -nc https://raw.githubusercontent.com/jetsonhacks/installTensorFlowJetsonTX/master/TX2/tensorflow-1.3.0-cp35-cp35m-linux_aarch64.whl
		sudo pip install tensorflow-1.3.0-cp35-cp35m-linux_aarch64.whl			# Install tensorflow
	fi
fi


