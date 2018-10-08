#!/bin/bash
set -e

[ $(id -u www-data) -ne $UID -o $(id -g www-data) -ne $GID ] && groupmod -g $GID www-data && usermod -u $UID www-data

exec sudo -u www-data $@

