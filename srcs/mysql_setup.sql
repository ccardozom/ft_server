CREATE DATABASE wordpress;

CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'paraguayo'
 
GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;

/*update mysql.user set plugin = 'mysql_native_password' where user='root';