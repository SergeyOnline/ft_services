# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/26 12:11:03 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/26 12:11:05 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN	apk update
RUN	apk add openrc openssl supervisor nginx php7 php7-fpm php7-iconv \
    	php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN	rc-update add php-fpm7 default

RUN	mkdir -p /run/nginx
RUN	mkdir -p var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN	chmod 777 var/www/phpmyadmin/tmp

RUN	wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
RUN	tar -zxvf phpMyAdmin-latest-english.tar.gz --strip-components 1 -C var/www/phpmyadmin
RUN	rm phpMyAdmin-latest-english.tar.gz

COPY	srcs/supervisord.conf /etc/supervisord.conf
COPY	srcs/config.inc.php var/www/phpmyadmin
COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE	5000

CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]