FROM alpine:3.3

MAINTAINER Ricardo Quintaniha <ricardo.aquintanilha@gmail.com>

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories;

RUN apk add --update php \
    php-cli \
    php-pdo \
    php-pdo_sqlite \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-redis@testing \
    php-memcached@testing \
    php-json \
    php-openssl \
    php-dev \
    php-curl \
    php-mcrypt \
    php-phar \
    php-xdebug@testing \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

RUN sed -i 's/display_errors = Off/display_errors = On/g' /etc/php/php.ini \
    && sed -i 's/extension/zend_extension/g' /etc/php/conf.d/xdebug.ini

RUN php -r "readfile('https://getcomposer.org/installer', false, stream_context_create(['ssl' => ['verify_peer' => false, 'verify_peer_name' => false]]));" > composer-setup.php \
    && php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"
