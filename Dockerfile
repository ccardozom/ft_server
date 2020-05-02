FROM debian:buster

# UPDATE
RUN apt-get update
RUN apt-get upgrade -y

# INSTALL NGINX
RUN apt-get -y install nginx

# INSTALL MYSQL
RUN apt-get -y install mariadb-server

# INSTALL PHP
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring

# INSTALL TOOLS
RUN apt-get -y install wget

# COPY CONTENT
COPY ./srcs/start.sh /var/
COPY ./srcs/mysql_setup.sql /var/
COPY ./srcs/wordpress.sql /var/
COPY ./srcs/wordpress.tar.gz /var/www/html/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

# INSTALL PHPMYADMIN
WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

# INSTALL WORDPRESS
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz && rm -rf latest.tar.gz
RUN chmod 755 -R wordpress

# SETUP SERVER
RUN service mysql start && mysql -u root mysql < /var/mysql_setup.sql && mysql wordpress -u root --password= < /var/wordpress.sql
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=sdunckel' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
RUN chown -R www-data:www-data *
RUN chmod 755 -R *

# START SERVER
CMD bash /var/start.sh