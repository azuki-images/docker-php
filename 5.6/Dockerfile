FROM alpine

RUN apk add --update git vim curl wget ca-certificates
RUN apk add php php-cli php-json php-pdo php-openssl php-pdo_mysql php-dev php-pear php-curl php-mcrypt php-phar php-phalcon
RUN rm -rf /var/cache/apk/*

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/php.ini && \
    sed -i 's/display_errors=0/display_errors=1/g' /etc/php/php.ini

EXPOSE 8000
