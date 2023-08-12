#!/bin/bash

COMPOSER_MEMORY_LIMIT=-1 composer install
php artisan key:generate

# Start php-fpm service (running a service also prevents container from exiting)
php-fpm