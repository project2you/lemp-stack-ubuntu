read -p "Write the host name, eg. xxx.com :" HOST;

mkdir -p /var/www/$HOST.$DOMAIN/web
mkdir -p /var/www/$HOST.$DOMAIN/logs
mkdir -p /var/www/$HOST.$DOMAIN/ssl

touch /etc/apache2/sites-available/$HOST

echo "<VirtualHost *:80>
    ServerAdmin admin@$HOST
    ServerName $HOST 
    ServerAlias $HOST

    ErrorLog /var/www/$HOST/logs/error.log
    LogLevel warn
    CustomLog /var/www/$HOST/logs/access.log combined
    
    DocumentRoot /var/www/$HOST/web
    <Directory />
        Options FollowSymLinks
        AllowOverride None
    </Directory>
    <Directory /var/www/$HOST/web/ >
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from All
        Require all granted
    </Directory>
</VirtualHost>" >> /etc/apache2/sites-available/$HOST

ln -s /etc/apache2/sites-available/$HOST.$DOMAIN /etc/apache2/sites-enabled/$HOST.conf

service apache2 restart
