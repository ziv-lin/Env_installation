#!/bin/bash
###################################################
# -- Install Apps for tx2:
#	Git
#	Vim
#	Python=3.6.5
#	Ros
###################################################
export USER_NAME="ziv.lin"
export USER_EMAIL="ziv.lin.ljr@gmail.com"
export IF_VIM=0 	# Set 1 to install vim and vim's plug-in
export IF_PYTHON=1	# Set 1 to install recommand python version
export PYTHON_MAJOR_VERSION=3.6
export PYTHON_MINJOR_VERSION=5 
export PYTHON_VERSION=${PYTHON_MAJOR_VERSION}.${PYTHON_MINJOR_VERSION} #Install python version= 3.6.5

if [IF_PYTHON=1]; then
	echo "You are going to install python ${PYTHON_VERSION}"
fi

###################################################
echo "====== --------- ======"
echo "====== setup git ======"
echo "====== --------- ======"
sudo apt-get --assume-yes install git gitk
git config --global --unset http.proxy 
git config --global --unset https.prox
git config --global user.name "ziv.lin"  
git config --global user.email "730470317@qq.com"

###################################################
if [ IF_VIM = 1 ]; then
	echo "====== --------- ======"
	echo "====== setup vim ======"
	echo "====== --------- ======"
	sudo apt-get --assume-yes install vim
	./install_vim.sh
fi

###################################################
if [ IF_VIM = 1 ]; then
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
	sudo mv /usr/bin/pip /usr/bin/pip_bak_before_${PYTHON_MAJOR_VERSION}		# Backup system's pip
	
	sudo ln -s /usr/local/bin/python${PYTHON_MAJOR_VERSION} /usr/bin/python		# setup python3.6 as default
	sudo ln -s /usr/local/bin/pip${PYTHON_MAJOR_VERSION} /usr/bin/pip		# setup pip3.6 as default
fi
