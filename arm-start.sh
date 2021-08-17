#!/bin/bash

docker network create -d bridge dnmp

docker run -d \
	--name php-fpm \
	--network dnmp \
	-v $(pwd)/www:/usr/share/nginx/html \
	iuxt/dnmp_php-fpm:arm

docker run -d \
	--name nginx \
	--network dnmp \
	-p 7000:80 \
	-v $(pwd)/www:/usr/share/nginx/html \
	iuxt/dnmp_nginx:arm

