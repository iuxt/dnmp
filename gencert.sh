#!/bin/sh

# create self-signed server certificate:

read -p "Enter your domain [example.com]: " DOMAIN

echo "Create server key..."

openssl genrsa -des3 -out $DOMAIN.key 2048

echo "Create server certificate signing request..."

SUBJECT="/C=CN/ST=Shanghai/L=Pudong/O=Bimawen/OU=zhanglikun/CN=$DOMAIN"

openssl req -new -subj $SUBJECT -key $DOMAIN.key -out $DOMAIN.csr

echo "Remove password..."

mv $DOMAIN.key $DOMAIN.origin.key
openssl rsa -in $DOMAIN.origin.key -out $DOMAIN.key

echo "Sign SSL certificate..."

openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt

echo "
TODO:
Copy $DOMAIN.crt to /etc/nginx/ssl/$DOMAIN.crt
Copy $DOMAIN.key to /etc/nginx/ssl/$DOMAIN.key
Add configuration in nginx:
server {
    ...
    listen 443 ssl;
    ssl_certificate     /etc/nginx/ssl/$DOMAIN.crt;
    ssl_certificate_key /etc/nginx/ssl/$DOMAIN.key;
}
"
