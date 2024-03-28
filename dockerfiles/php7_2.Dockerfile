FROM php:7.2.32-fpm

WORKDIR ${SITE_PATH}

# install git
RUN apt-get update && \
    apt-get install -y --no-install-recommends git

#install some base extensions
RUN apt-get install -y \
    zlib1g-dev \
    zip \
    libpng-dev \
    exiftool \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libicu-dev \
    libpq-dev \
    libxpm-dev \
    libvpx-dev \
    mariadb-client \
    libxml2-dev \
    libnss3 

RUN docker-php-ext-install -j$(nproc) \
    zip \
    exif \
    bcmath \
    intl \
    pcntl \
    mysqli \
    pdo \
    gd \
    pdo_mysql \
    pdo_pgsql \
    mbstring \
    soap \
    opcache \
    iconv \ 
    session

# Install Imagick
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# mcrypt
RUN pecl install mcrypt-1.0.3
RUN docker-php-ext-enable mcrypt

# xdebug
RUN pecl install xdebug-3.1.5 \
    && docker-php-ext-enable xdebug

# gd
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Install Composer
RUN echo "Install Composer"
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version