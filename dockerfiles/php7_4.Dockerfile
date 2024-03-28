FROM php:7.4-fpm-alpine

WORKDIR /var/www/html


RUN apk add --no-cache \
    $PHPIZE_DEPS \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
    --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && rm -rf /tmp/*

RUN apk add libzip-dev

RUN docker-php-ext-install pdo pdo_mysql mysqli zip bcmath

#xdebug
RUN pecl install xdebug-3.1.5 \
    && docker-php-ext-enable xdebug