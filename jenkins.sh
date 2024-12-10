sudo apt install openjdk-17-jre-headless  -y
java -version

sudo adduser shubham
ssh-keygen
ssh-keygen -t rsa -b 2048 -C

cd .ssh
#authorized_keys  id_rsa  id_rsa.pub  known_hosts
cat id_*.pub >> authorized_keys
cat id_rsa

# sudo permissions
sudo visudo
shubham  ALL=(ALL) NOPASSWD: ALL
sudo ls /root

