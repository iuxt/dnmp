#!/bin/bash
docker run --name=mysql \
	-v $(pwd)/mysql_data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 \
	--restart=always \
	-d mysql:8.0
