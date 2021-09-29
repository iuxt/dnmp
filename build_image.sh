#!/bin/bash
set -euf -o pipefail

arch=$(uname -i)
source .env

if [ $(docker images | grep -c dnmp_nginx) -ge 1 ]
then
    echo "dnmp_nginx image exist, please delete it"
else
    cd nginx
    docker build . -t iuxt/dnmp_nginx:${arch}
    cd ..
fi

if [ $(docker images | grep dnmp_php-fpm | grep -c ${PHP_VERSION}) -ge 1 ]
then
    echo "dnmp_php-fpm image exist, please delete it"
else
    cd php-fpm_${PHP_VERSION}
    docker build . -t iuxt/dnmp_php-fpm:${arch}-${PHP_VERSION}
    cd ..
fi
