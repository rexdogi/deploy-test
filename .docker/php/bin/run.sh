#!/bin/sh

# Wait for MySQL to be available
until nc -z -v -w30 db 3306
do
  echo "Waiting for database connection..."
  sleep 1
done

php artisan migrate

exec php-fpm
