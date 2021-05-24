#!/bin/sh

clear

minikube start --driver=virtualbox
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/yaml_config/configmap.yaml

docker build ./srcs/nginx -t nginx-image
echo "\033[32m [1] Nginx-image build\033[39m"
docker build ./srcs/phpmyadmin -t phpmyadmin-image
echo "\033[32m [2] Phpmyadmin-image build\033[39m"
docker build ./srcs/mysql -t mysql-image
echo "\033[32m [3] Mysql-image build\033[39m"
docker build ./srcs/wordpress -t wordpress-image
echo "\033[32m [4] Wordpress-image build\033[39m"
docker build ./srcs/ftps -t ftps-image
echo "\033[32m [5] Ftps-image build\033[39m"
docker build ./srcs/influxdb -t influxdb-image
echo "\033[32m [6] InfluxDB-image build\033[39m"
docker build ./srcs/grafana -t grafana-image
echo "\033[32m [7] Grafana-image build\033[39m"

kubectl apply -f ./srcs/yaml_config/volume.yaml
kubectl apply -f ./srcs/yaml_config/nginx.yaml
kubectl apply -f ./srcs/yaml_config/phpmyadmin.yaml
kubectl apply -f ./srcs/yaml_config/mysql.yaml
kubectl apply -f ./srcs/yaml_config/wordpress.yaml
kubectl apply -f ./srcs/yaml_config/ftps.yaml
kubectl apply -f ./srcs/yaml_config/influxdb.yaml
kubectl apply -f ./srcs/yaml_config/grafana.yaml

echo "\033[32mCluster launched.\n\033[33mWelcome to Kubernetis!!!\033[39m"
echo "\033[34mNginx IP     : 192.168.99.101\033[39m"
echo "\033[34mPhpmyadmin IP: 192.168.99.102\033[39m"
echo "\033[34mWordpress IP : 192.168.99.103\033[39m"
echo "\033[34mFtps IP      : 192.168.99.104\033[39m"
echo "\033[34mGrafana IP   : 192.168.99.105\033[39m"
echo "\033[32mHave a nice work!\033[39m"
