#!/bin/sh
cd /var/www/wallabag
/usr/local/bin/composer.phar install --no-dev -o --prefer-dist
chown -R www-data:www-data /var/www/wallabag
chmod 775 /var/www/wallabag/vendor
#php bin/console wallabag:install --env=prod || true
rm -rf /var/www/html
ln -s /var/www/wallabag/web /var/www/html

exec apache2-foreground