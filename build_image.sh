#!/bin/bash
set -euf -o pipefail

source .env

cd nginx
docker build . -t iuxt/dnmp_nginx
cd ..

cd php-fpm_${PHP_VERSION}
docker build . -t iuxt/dnmp_php-fpm:${PHP_VERSION}
cd ..