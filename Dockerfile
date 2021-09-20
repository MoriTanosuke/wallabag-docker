FROM php:7-apache-buster
MAINTAINER carsten@kopis.de

ARG VERSION=2.4.2

ENV WALLABAG_VERSION=$VERSION \
    SYMFONY_ENV=prod

# install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libpq-dev \
        libtidy-dev \
        git \
        zip unzip \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install sockets \
    && docker-php-ext-install tidy \
    && pecl install mcrypt && docker-php-ext-enable mcrypt
# install composer
RUN cd /usr/local/bin && curl -s http://getcomposer.org/installer | php
# download & install wallabag
RUN curl -o wallabag.tar.gz -L https://github.com/wallabag/wallabag/archive/${WALLABAG_VERSION}.tar.gz && \
    tar xvzf wallabag.tar.gz && \
    mv wallabag-${WALLABAG_VERSION} /var/www/wallabag && \
    rm wallabag.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
