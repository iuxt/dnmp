#!/bin/bash
docker run --name=mysql -v $(pwd)/mysql_data:/var/lib/mysql -d mysql/mysql-server
