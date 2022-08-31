#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

chmod -R 775 /var/www/html/wordpress;

chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

chmod +x wp-cli.phar;

mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."

wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};

wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

/usr/sbin/php-fpm7.3 -F