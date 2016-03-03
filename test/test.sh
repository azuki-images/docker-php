#!/bin/ash

# PHP should be in the right version
if [ ! "`php -v | grep "PHP ${PHP_VERSION_NEEDED}"`" ]; then
    echo "PHP is not installed or is not in the version ${PHP_VERSION_NEEDED}."
    exit 1
fi

# PHP should has some modules installed
expected_modules="memcached PDO pdo_mysql pdo_pgsql pdo_sqlite redis xdebug json openssl curl mcrypt dom intl ctype gd dom intl ctype gd iconv xsl zip"
installed_modules=`php -m`

for module in $expected_modules; do
    if [ ! "`echo $installed_modules | grep $module`" ]; then
        echo "Module '${module}' is not installed."
        exit 1
    fi
done

# Composer should be installed
if [ ! "`composer -v`" ]; then
    echo "Composer is not installed."
    exit 1
fi
