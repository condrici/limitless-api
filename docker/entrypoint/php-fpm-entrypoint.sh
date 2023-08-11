#!/bin/bash

COMPOSER_MEMORY_LIMIT=-1 composer install
php artisan key:generate

# Fix docker container exiting with code 0
tail -f /dev/null
