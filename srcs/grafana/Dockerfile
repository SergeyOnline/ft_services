# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/30 17:50:05 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/30 17:50:06 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN		apk update
RUN		apk add ca-certificates

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
		https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

RUN		wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.1.linux-amd64.tar.gz
RUN		tar -zxvf grafana-enterprise-7.3.1.linux-amd64.tar.gz
RUN		rm -rf grafana-7.3.1.linux-amd64.tar.gz

RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		apk add glibc-2.32-r0.apk
RUN		rm -f glibc-2.32-r0.apk

COPY		./srcs/grafana.db /grafana-7.3.1/data/

EXPOSE		3000

WORKDIR		/grafana-7.3.1/bin/

ENTRYPOINT	./grafana-server