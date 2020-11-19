create database wordpress;
CREATE USER 'phpmyadmin'@'localhost' identified by 'chacoparaguayo';
GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost';
FLUSH PRIVILEGES;
UPDATE mysql.user SET Password=PASSWORD('chacoparaguayo') WHERE User='phpmyadmin' AND Host='localhost';