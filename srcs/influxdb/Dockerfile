# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/29 19:52:23 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/29 19:52:39 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN	apk update 
RUN	apk add influxdb supervisor ca-certificates

RUN	wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
	https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

RUN	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN	apk add glibc-2.32-r0.apk
RUN	rm -f glibc-2.32-r0.apk

RUN	wget -c https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz
RUN	tar -zxvf telegraf-1.16.1_linux_amd64.tar.gz --strip-components 1 -C .
RUN	cp -r /telegraf-1.16.1/* /
RUN	rm telegraf-1.16.1_linux_amd64.tar.gz
RUN	./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf


VOLUME	["/var/lib/"]

EXPOSE	8086

COPY	srcs/supervisord.conf /etc/supervisord.conf
CMD	["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]