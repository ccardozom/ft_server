FROM debian:buster

#UPDATE
RUN apt-get update
RUN apt-get upgrade -y

# INSTALA NGINX
RUN apt-get -y install nginx

# INSTALA MYSQL
RUN apt-get -y install mariadb-server

# INSTALA PHP
RUN apt-get -y install php-mysql php-fpm

# INSTALAR HERRAMIENTA WGET
RUN apt-get -y install wget

# COPIAR ARCHIVOS CON LAS CONFIGURACIONES DESDE SRCS(LOCAL) AL CONTENEDOR
COPY /srcs/config /etc/nginx/sites-available/localhost
COPY /srcs/info.php /var/www/html/
COPY /srcs/index.html /var/www/html/
COPY /srcs/autoindex_off.sh /
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
COPY /srcs/start.sh /var/
COPY /srcs/mysql_setup.sql /var/
COPY /srcs/wp-config.php /var/

# INSTALA PHPMYADMIN
WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin
COPY /srcs/config.inc.php phpmyadmin

# DESCARGA WORDPRESS Y MUEVE EL ARCHIVO DE CONFIGURACION A LA CARPETA WORDPRESS
RUN wget -c https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && \
    mv /var/wp-config.php /var/www/html/wordpress/

# SETUP MYSQL EN EL SERVIDOR
COPY /srcs/mysql_setup.sql /tmp/
RUN service mysql start && \
    mysql < /tmp/mysql_setup.sql && \
    rm /tmp/mysql_setup.sql

#CERTIFICADO SSL
RUN apt-get install -y openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=ES/ST=MADRID/L=MADRID/O=42/CN=ChacoParaguayo' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

WORKDIR /
#PUERTOS POR DONDE ESCUCHA DOCKER
EXPOSE 80 443
# START SERVER
CMD bash /var/start.sh
