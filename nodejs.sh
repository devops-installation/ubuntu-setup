sudo apt-get update

sudo apt install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm --version

sudo apt-get update
nvm install node --lts

nvm use 16
nvm uninstall 12

