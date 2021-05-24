# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/27 15:29:16 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/27 15:29:21 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN	apk update

RUN	apk add openrc nginx supervisor mysql mysql-client \
    	php7 php7-fpm php7-json php7-mysqli

RUN	rc-update add php-fpm7 default

RUN	mkdir -p /run/nginx
RUN	mkdir -p /var/run/php

RUN	mkdir -p /var/www

RUN	wget https://wordpress.org/latest.tar.gz
RUN	tar -zxvf latest.tar.gz -C /var/www/
RUN	rm latest.tar.gz

COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	srcs/supervisord.conf /etc/supervisord.conf

EXPOSE	5050

CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]