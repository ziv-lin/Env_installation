###################################################
echo "====== --------- ======"
echo "====== setup git ======"
echo "====== --------- ======"
sudo apt-get --assume-yes install git gitk
git config --global --unset http.proxy 
git config --global --unset https.prox
git config --global user.name "ziv.lin"  
git config --global user.mail "730470317@qq.com"
###################################################
echo "====== --------- ======"
echo "====== setup vim ======"
echo "====== --------- ======"
sudo apt-get --assume-yes install vim
./install_vim.sh
###################################################
echo "====== ------------------------ ======"
echo "====== setup python environment ======"
echo "====== ------------------------ ======"
sudo apt-get --assume-yes install build-essential checkinstall
sudo apt-get --assume-yes install libreadline-gplv2-dev  libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo wget -nc https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
sudo tar xzf Python-3.6.5.tgz
cd Python-3.6.5
sudo ./configure --enable-optimizations
sudo make altinstall
