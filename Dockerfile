FROM kouinkouin/debian-base:10

ARG PHP_VERSION=7.4

ENV PHP_VERSION=$PHP_VERSION UID=33 GID=33

RUN wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ buster main" > /etc/apt/sources.list.d/php.list && \
    apt-get update

RUN \
    apt-get install -y \
        php-amqp \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-bz2 \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-json \
        php-mail \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-memcached \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-readline \
        php${PHP_VERSION}-soap \
        php-ssh2 \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-xmlrpc \
        php${PHP_VERSION}-zip \
        php-sodium \
        git \
        gettext \
        zip \
        && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

RUN wget -q https://getcomposer.org/installer -O /tmp/composer-setup.php && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm /tmp/composer-setup.php

ADD files/run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run

ENTRYPOINT ["run"]

