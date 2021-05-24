# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sbroderi <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/28 13:39:22 by sbroderi          #+#    #+#              #
#    Updated: 2020/10/28 13:39:24 by sbroderi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.7

RUN	apk update
RUN	apk add vsftpd openssl

RUN     openssl req -days 365 -newkey rsa:2048 -x509 -sha256 -nodes -out /etc/vsftpd/vsftpd.pem \
        -keyout /etc/vsftpd/vsftpd.pem -subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=sbroderi'

RUN	echo 'root:root' | chpasswd

COPY	srcs/vsftpd.conf /etc/vsftpd/

EXPOSE	21

CMD	vsftpd /etc/vsftpd/vsftpd.conf
