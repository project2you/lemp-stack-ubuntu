
# Install Mysql
sudo apt-get install mysql-server -y # Or MySQL: sudo apt-get install mysql-server
sudo service mysql stop # Stop the MySQL if is running.
sudo mysql_install_db
sudo service mysql start
sudo mysql_secure_installation

# Install PHP 7.2
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install php7.2 -y

# Install needed modules for PHP
sudo apt-get install php7.2-fpm php7.2-mysql php7.2-curl php7.2-gd php7.2-bz2 php7.2-mbstring php7.2-xml php7.2-zip php-gettext php-xml php7.2-soap  -y
sudo apt install unzip -y
sudo apt install mysql-client-core-5.7 -y 
