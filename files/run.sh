#!/bin/bash
set -e

[ $(id -u www-data) -ne $UID -o $(id -g www-data) -ne $GID ] && groupmod -g $GID www-data && usermod -u $UID www-data

mkdir -p /var/www && chown -R www-data. /var/www

exec sudo -u www-data $@

