sudo apt update
# remove older version docker
sudo apt remove docker docker-engine docker.io containerd runc

# instLL dependancy
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt  install docker-compose 
sudo usermod -aG docker $USER


# install by script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
Executing docker install script, commit: 7cae5f8b0decc17d6571f9f52eb840fbc13b2737
<...>

# docker command 
sudo service docker start
sudo apt install docker.io
#sudo snap install docker
docker -v
sudo systemctl enable docker.service
sudo systemctl restart docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

# Docker Compose
sudo apt update
sudo apt install -y docker-compose-plugin

docker-compose build
docker-compose pull
docker-compose down
docker-compose up  -d
docker system prune -af


# uninstall engine 
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

#Remove source list and keyrings
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /etc/apt/keyrings/docker.asc
