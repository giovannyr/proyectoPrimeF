CREATE USER 'dev'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'dev'@'localhost';
FLUSH PRIVILEGES;
