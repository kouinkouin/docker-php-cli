#!/bin/bash
set -e

[ $(id -u www-data) -ne $UID -o $(id -g www-data) -ne $GID ] && groupmod -g $GID www-data && usermod -u $UID www-data

if [ ! -d /var/www ]; then
  mkdir -p /var/www && chown -R www-data. /var/www
fi

exec sudo -E -u www-data $@
