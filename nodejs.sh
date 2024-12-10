#install node + npm 
sudo apt update && sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
#pm2 
sudo npm install -g pm2

npm install
npm install -g yarn

pm2 start app.js --name my-api
pm2 startup
pm2 save
pm2 logs 0
pm2 stop nodejs-app
pm2 restart nodejs-app



#install NVM
sudo apt-get update

sudo apt install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm --version

sudo apt-get update
nvm install node --lts

nvm use 16
nvm uninstall 12

#reverse proxy
'''
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

'''
sudo ln -s /etc/nginx/sites-available/nodejs-app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

