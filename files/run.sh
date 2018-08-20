#!/bin/bash
set -e

usermod -u $UID -g $GID www-data

exec $@

