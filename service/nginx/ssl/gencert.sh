#!/bin/bash

## 创建根证书，自签的根证书需要设备信任

if [ -e ca.crt ]; then
    echo ca exists 
else
    openssl ecparam -out ca.key -name prime256v1 -genkey
    openssl req -new -sha256 -key ca.key -out ca.csr -subj "/C=CN/ST=ShangHai/L=PuDong/O=Bimawen/CN=bimawen.cc"
    openssl x509 -req -sha256 -days 36500 -in ca.csr -signkey ca.key -out ca.crt 
fi


## 创建服务器证书
echo "========================================================================================================================================"
openssl ecparam -out server.key -name prime256v1 -genkey
openssl req -new -sha256 -key server.key -out server.csr -subj "/C=CN/ST=ShangHai/L=PuDong/O=zhanglikun/CN=test.com"
openssl x509 -req -in server.csr -CA  ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365 -sha256
openssl x509 -in server.crt -text -noout
