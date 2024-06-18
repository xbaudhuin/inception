FROM  debian:bullseye

RUN   apt update -y && apt upgrade -y

RUN   apt install -y wget net-tools 

RUN   apt-get install -y php7.4 php-fpm php-mysql
RUN   apt-get install -y mariadb-client

COPY  ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY  ./conf/www.conf /etc/php/7.4/fpm/con.d/www.conf
RUN   ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

RUN   wget https://fr.wordpress.org/wordpress-6.5.3-fr_FR.tar.gz -P /var/www

WORKDIR   /var/www
RUN   tar -xzf wordpress-6.5.3-fr_FR.tar.gz && rm wordpress-6.5.3-fr_FR.tar.gz && chmod 777 wordpress

WORKDIR /var/www/wordpress
RUN   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN   mkdir -p /run/php && chown -R www-data:www-data /var/www/wordpress

EXPOSE 9000

COPY  ./tools/config_wordpress.sh /usr/bin/config_wordpress.sh

RUN   chmod 777 /usr/bin/config_wordpress.sh

ENTRYPOINT  [ "bash", "/usr/bin/config_wordpress.sh" ]
