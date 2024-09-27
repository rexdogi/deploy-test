FROM php:8.2-fpm

WORKDIR /var/www

COPY . /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libpng-dev \
        libicu-dev \
        libxml2-dev \
        zip \
        nodejs \
        npm \
        default-mysql-client \
        netcat-openbsd \
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

RUN chown -R www-data:www-data /var/www

RUN chmod +x /var/www/.docker/php/bin/run.sh

RUN composer install

RUN npm install

ENTRYPOINT ["/var/www/.docker/php/bin/run.sh"]
