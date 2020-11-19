# !/bin/sh
sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/localhost
service nginx restart
