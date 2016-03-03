FROM azukiapp/alpine:3.3

MAINTAINER Ricardo Quintaniha <ricardo.aquintanilha@gmail.com>

ENV PKG_NAME php

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories;

RUN apk add --update \
    ${PKG_NAME} \
    ${PKG_NAME}-cli \
    ${PKG_NAME}-pdo \
    ${PKG_NAME}-pdo_sqlite \
    ${PKG_NAME}-pdo_mysql \
    ${PKG_NAME}-pdo_pgsql \
    ${PKG_NAME}-redis@testing \
    ${PKG_NAME}-memcached@testing \
    ${PKG_NAME}-json \
    ${PKG_NAME}-openssl \
    ${PKG_NAME}-dev \
    ${PKG_NAME}-curl \
    ${PKG_NAME}-mcrypt \
    ${PKG_NAME}-dom \
    ${PKG_NAME}-intl \
    ${PKG_NAME}-ctype \
    ${PKG_NAME}-gd \
    ${PKG_NAME}-dom \
    ${PKG_NAME}-intl \
    ${PKG_NAME}-ctype \
    ${PKG_NAME}-gd \
    ${PKG_NAME}-iconv \
    ${PKG_NAME}-xsl \
    ${PKG_NAME}-zip \
    ${PKG_NAME}-phar \
    ${PKG_NAME}-xdebug@testing \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

RUN sed -i 's/display_errors = Off/display_errors = On/g' /etc/php/php.ini \
    && sed -i 's/extension/zend_extension/g' /etc/php/conf.d/xdebug.ini

RUN php -r "readfile('https://getcomposer.org/installer', false, stream_context_create(['ssl' => ['verify_peer' => false, 'verify_peer_name' => false]]));" > composer-setup.php \
    && php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

CMD ["php", "-a"]
