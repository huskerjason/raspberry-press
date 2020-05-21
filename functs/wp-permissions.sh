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

		sudo usermod -a -G www-data $USER
		sudo find /var/www/ -exec chown $USER:www-data {} +
		sudo find /var/www/ -type f -exec chmod 664 {} +
		sudo find /var/www/ -type d -exec chmod 775 {} +
		sudo chown -R www-data: /var/www/

		sudo mariadb -e "TRUNCATE $WP_DATABASE_NAME."$WP_PREFIX"posts;";
		sudo mariadb -e "TRUNCATE $WP_DATABASE_NAME."$WP_PREFIX"postmeta;";
		sudo mariadb -e "TRUNCATE $WP_DATABASE_NAME."$WP_PREFIX"comments;"
		sudo mariadb -e "UPDATE $WP_DATABASE_NAME."$WP_PREFIX"options SET option_value='$(hostname -I)' WHERE option_name='blogdescription';"
		sudo mariadb -e "UPDATE $WP_DATABASE_NAME."$WP_PREFIX"options SET option_value='America/Detroit' WHERE option_name='timezone_string';"
		sudo mariadb -e "UPDATE $WP_DATABASE_NAME."$WP_PREFIX"options SET option_value='/%postname%/' WHERE option_name='permalink_structure';"
		sudo mariadb -e "UPDATE $WP_DATABASE_NAME."$WP_PREFIX"options SET option_value='0' WHERE option_name='start_of_week';"
		sudo mariadb -e "UPDATE $WP_DATABASE_NAME."$WP_PREFIX"options SET option_value='' WHERE option_name='wp_page_for_privacy_policy';"


	}

