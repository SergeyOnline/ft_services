# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/26 17:51:58 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/26 17:51:59 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN	apk add openrc mysql mysql-client

COPY	srcs/my.cnf ./etc/mysql/
COPY	srcs/init_wp.sh ./
COPY	srcs/wordpress.sql ./

VOLUME	["/var/lib/mysql"]

RUN	chmod 777 init_wp.sh

EXPOSE	3306

CMD	./init_wp.sh

