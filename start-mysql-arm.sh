#!/bin/bash
docker run --name=mysql \
    -v $(pwd)/mysql_data:/var/lib/mysql \
    -p 3306:3306 \
    -d mysql/mysql-server
    
docker logs mysql 2>&1 | grep GENERATED
