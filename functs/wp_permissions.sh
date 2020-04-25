###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################



	function wp_permissions {

		##
		##
		##	Last step is to set the permissions. This lets you use ftp or
		##	or an editor. It also lets WP get themes and plugins from the
		##	WP repository.
		##
		#######################################################################

		sudo usermod -a -G www-data pi
		sudo find /var/www/ -exec chown pi:www-data {} +
		sudo find /var/www/ -type f -exec chmod 664 {} +
		sudo find /var/www/ -type d -exec chmod 775 {} +
		sudo chown -R www-data: /var/www/
		sudo mariadb -e "UPDATE WP_DATABASE_NAME."$WP_PREFIX"options SET option_value = '$(hostname -I)' WHERE option_name = 'blogdescription';"

	}

