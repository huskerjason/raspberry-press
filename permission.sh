#!/bin/bash

###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################

DIR_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR_CURRENT=$(pwd)

cd $DIR_SOURCE

sudo usermod -a -G www-data pi
sudo find /var/www/ -exec chown pi:www-data {} +
sudo find /var/www/ -type f -exec chmod 664 {} +
sudo find /var/www/ -type d -exec chmod 775 {} +
sudo chown -R www-data: /var/www/

db=$(grep 'table_prefix' /var/www/wp-config.php | cut -f2 -d"'")
prefix=$(grep 'DB_NAME' /var/www/wp-config.php |cut -f4 -d"'")
sudo mariadb -e "UPDATE $db."$prefix"options SET option_value = '$(hostname -I)' WHERE option_name = 'blogdescription';"

cd $DIR_CURRENT
