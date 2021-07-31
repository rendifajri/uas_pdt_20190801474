#! /bin/sh
#Instalasi Web Server Nginx dengan High Availability Load Balanced
apt-get install nginx
echo "upstream web_backend{" >> /etc/nginx/sites-available/default
echo "   server 10.11.12.51" >> /etc/nginx/sites-available/default
echo "   server 10.11.12.52" >> /etc/nginx/sites-available/default
echo "}" >> /etc/nginx/sites-available/default
echo "server {" >> /etc/nginx/sites-available/default
echo "   listen 80;" >> /etc/nginx/sites-available/default
echo "   location / {" >> /etc/nginx/sites-available/default
echo "      proxy_set_header X-Forwarded-For $proxy_add_x_for;" >> /etc/nginx/sites-available/default
echo "      proxy_pass http://web_backend" >> /etc/nginx/sites-available/default
echo "   }" >> /etc/nginx/sites-available/default
echo "}" >> /etc/nginx/sites-available/default
service nginx reload