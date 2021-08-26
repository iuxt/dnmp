#!/bin/bash
docker run --name=mysql \
	-v $(pwd)/mysql_data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 \
	-e MYSQL_DATABASE=wordpress \
        -p 3306:3306 \
	--restart=always \
	-d mysql:5.7.32
