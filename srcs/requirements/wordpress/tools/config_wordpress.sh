#!/bin/bash

sleep 10;

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

  wp config create  --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_USER_PASSWORD \
                    --dbhost=mariadb \
                    --dbprefix=wp_ \
                    --dbcharset=utf8 \
                    --path=/var/www/wordpress/ \
                    --allow-root;

  wp core install --allow-root \
                  --url=$URL_INCEPTION \
                  --title=inception \
                  --admin_user=$WP_ADMIN \
                  --admin_email=$WP_ADMIN_MAIL \
                  --admin_password=$WP_ADMIN_PASSWORD;

  wp user create  --allow-root $WP_USER $WP_USER_EMAIL \
                  --user_pass=$WP_USER_PASSWORD \
                  --role=editor \

fi

 exec php-fpm7.4 -F;
