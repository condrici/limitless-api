FROM php:8.2-fpm

# Composer
RUN apt-get update
RUN apt --yes --force-yes install curl unzip
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
