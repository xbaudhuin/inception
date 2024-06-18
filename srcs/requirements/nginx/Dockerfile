FROM	debian:bullseye

RUN 	apt -y update && apt upgrade -y \
			&& apt install -y nginx

RUN 	mkdir - p /etc/nginx/ssl && apt install openssl -y

RUN 	mkdir -p /etc/nginx/ssl/private && mkdir -p /etc/nginx/ssl/certs && mkdir -p /var/run/nginx

RUN 	openssl req -x509 -nodes -out /etc/nginx/ssl/xabaudhu.42.fr.crt -keyout /etc/nginx/ssl/xabaudhu.42.fr.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=xabaudhu.42.fr/UID=xabaudhu" 

COPY 	./conf/nginx.conf /etc/nginx/nginx.conf

RUN 	mkdir -p /var/www/wordpress && chmod 755 /var/www/wordpress
RUN 	chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD 	[ "nginx", "-g", "daemon off;" ]
