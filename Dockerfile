FROM php:7.0-apache
MAINTAINER Mark Wienk <mark@wienkit.nl>

RUN requirements="libpng12-dev libjpeg-dev libjpeg62-turbo libmcrypt4 libmcrypt-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt

RUN echo "log_errors=On" > /usr/local/etc/php/php.ini \
    && echo "error_log = /dev/stderr" >> /usr/local/etc/php/php.ini
