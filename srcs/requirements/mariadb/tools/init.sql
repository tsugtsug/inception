CREATE DATABASE database_name_here;
CREATE USER 'username_here'@'%' IDENTIFIED BY 'password_here';
GRANT ALL PRIVILEGES ON *.* TO 'username_here'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
