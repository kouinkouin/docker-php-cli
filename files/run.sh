#!/bin/bash
set -e

[ $(id -u www-data) -ne $UID -o $(id -g www-data) -ne $GID ] && usermod -u $UID -g $GID www-data

exec sudo -u www-data $@

