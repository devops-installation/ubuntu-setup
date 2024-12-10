sudo apt update
sudo apt upgrade -y

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl stop nginx
sudo systemctl reload nginx
sudo systemctl status nginx
# install SSL Certificate

sudo apt update
sudo apt install -y certbot python3-certbot-nginx

sudo nginx -t
sudo systemctl restart nginx
sudo certbot --nginx -d example.com
sudo certbot renew --dry-run
sudo systemctl restart nginx
'''
server {
    listen 80;
    server_name example.com;

    root /var/www/wordpress;
    index index.php index.html index.htm;

    ssl_certificate /etc/nginx/ssl/example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/example.com.key;

    location / {
        root /var/www/html;
        index index.html;
    }
}
'''
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
