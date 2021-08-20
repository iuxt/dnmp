#!/bin/bash
docker run --name=mysql \
	-v $(pwd)/mysql_data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 \
	-e MYSQL_DATABASE=wordpress \
	--restart=always \
	-d mysql:5.7.32
