FROM php:8.1-fpm

WORKDIR /usr/src/app

# Install Composer
ENV COMPOSER_VERSION 2.0.12

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libpng-dev \
        libicu-dev \
        libxml2-dev \
        zip \
        nodejs \
        npm \
        default-mysql-client \
    && apt-get clean \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install \
        exif \
        gd \
        opcache \
        pdo_mysql \
        pcntl \
        zip \
        bcmath \
        intl \
        soap \
    && rm -rf /var/lib/apt/lists/*;

RUN chown -R www-data:www-data . /usr/src/app

ENTRYPOINT ["/usr/src/app/.docker/php/bin/run.sh"]


