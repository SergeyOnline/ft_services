# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/23 23:33:57 by Sbroderi          #+#    #+#              #
#    Updated: 2020/10/23 23:34:01 by Sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN	apk update && apk add nginx supervisor sudo openssl openssh

RUN	adduser -D -g 'www' www
RUN	mkdir /www
RUN	chown -R www:www /var/lib/nginx
RUN	chown -R www:www /www
RUN	mkdir -p /run/nginx

COPY	srcs/supervisord.conf /etc/supervisord.conf
COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	srcs/index.html /var/www/index.html

RUN	adduser -D sbroderi \
    	&& echo 'sbroderi:sbroderi' | chpasswd \
    	&& addgroup sbroderi wheel \
    	&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
    	&& /usr/bin/ssh-keygen -A

RUN	openssl req -x509 -days 30 -newkey rsa:2048 -keyout сca.key -nodes -out ca.crt \
	-subj '/C=RU/L=Ufa/CN=sbroderi' -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/certs/nginx.key \
	&& chown -R root:root /var/www \
	&& chmod 755 -R /var/*

EXPOSE	80
EXPOSE	441
EXPOSE	22


CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]