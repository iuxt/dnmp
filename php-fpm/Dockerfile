FROM php:7.4-fpm
ENV TZ='Asia/Shanghai'

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN apt update && apt install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && apt clean all

RUN docker-php-ext-configure mysqli \
        && docker-php-ext-install -j$(nproc) mysqli \
        && apt clean all

RUN apt install libzip-dev -y \
        && docker-php-ext-configure zip \
        && docker-php-ext-install -j$(nproc) zip \
        && apt clean all

RUN docker-php-ext-configure exif \
        && docker-php-ext-install -j$(nproc) exif

RUN docker-php-ext-configure opcache \
        && docker-php-ext-install -j$(nproc) opcache
