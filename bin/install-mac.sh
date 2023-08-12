#!/bin/bash

# Set path to root directory
# shellcheck disable=SC2164
SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "${SCRIPT_PATH}" && cd ..

#########################
# CHECK PRE-REQUISITES
#########################

DOCKER_ENV_FILE=./.env
LARAVEL_ENV_FILE=./laravel/.env

# Make sure that docker .env file exists
if ! test -f "$DOCKER_ENV_FILE"; then
    echo "There is no $DOCKER_ENV_FILE file, please create one from .env.example and restart installation..."
    exit
fi

# Make sure that laravel .env file exists
if ! test -f "$LARAVEL_ENV_FILE"; then
    echo "There is no $LARAVEL_ENV_FILE file, please create one from .env.example and restart installation..."
    exit
fi

# Create synced docker volumes
mkdir -p docker/volumes/mysql

# Docker needs execute permissions for the entrypoint files
chmod g+x docker/entrypoint/php-fpm-entrypoint.sh

#########################
# INITIALIZATION
#########################

# Start docker containers
docker-compose up
