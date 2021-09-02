#!/bin/bash
docker run --name=mysql \
    -v $(pwd)/mysql_data:/var/lib/mysql \
    -p 3306:3306 \
    --restart=always \
    -d mysql/mysql-server
    
sleep 10
docker logs mysql 2>&1 | grep GENERATED
