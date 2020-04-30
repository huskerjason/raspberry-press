###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################



	function get_wordpress {

		##
		##
		##	First part gets the WP install. unpacks it, and get it in the
		##	the right folder. Second part fills in the wp-config with the
		##	above parameters
		##
		#######################################################################

		text="Installing and configuring WordPress."
		whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'


		sudo tar xzf files/wordpress-5.4.1.tar.gz > /dev/null
		sudo rm -rf /var/www/html/*
		sudo mv wordpress/* /var/www/html/
		sudo rm -r wordpress
		sudo rm /var/www/html/wp-content/plugins/hello.php
		sudo rm -R /var/www/html/wp-content/plugins/akismet

		sudo chown -R www-data: /var/www/html/

		sudo cp /var/www/html/wp-config-sample.php /var/www/wp-config.php

		sudo sed -i "s|define( 'DB_NAME', 'database_name_here' );|define( 'DB_NAME', '$WP_DATABASE_NAME' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'DB_USER', 'username_here' );|define( 'DB_USER', '$WP_DATABASE_USERNAME' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'DB_PASSWORD', 'password_here' );|define( 'DB_PASSWORD', '$WP_DATABASE_PASSWORD' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'AUTH_KEY',         'put your unique phrase here' );|define( 'AUTH_KEY',         '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );|define( 'SECURE_AUTH_KEY',  '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'LOGGED_IN_KEY',    'put your unique phrase here' );|define( 'LOGGED_IN_KEY',    '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'NONCE_KEY',        'put your unique phrase here' );|define( 'NONCE_KEY',        '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'AUTH_SALT',        'put your unique phrase here' );|define( 'AUTH_SALT',        '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );|define( 'SECURE_AUTH_SALT', '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'LOGGED_IN_SALT',   'put your unique phrase here' );|define( 'LOGGED_IN_SALT',   '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|define( 'NONCE_SALT',       'put your unique phrase here' );|define( 'NONCE_SALT',       '$(pwgen -s 64 1)' );|" /var/www/wp-config.php
		sudo sed -i "s|\$table_prefix = 'wp_';|\$table_prefix = '$WP_PREFIX';|" /var/www/wp-config.php

		if [[ $WP_DEBUG == 1 ]]; then
			sudo sed -i "s|define( 'WP_DEBUG', false );|define( 'WP_DEBUG', true );|" /var/www/wp-config.php
		fi

		if [[ ! " ${WP_THEMES[@]} " =~ "Twenty Nineteen" ]]; then
			sudo rm -R /var/www/html/wp-content/themes/twentynineteen
		fi

		if [[ ! " ${WP_THEMES[@]} " =~ "Twenty Seventeen" ]]; then
			sudo rm -R /var/www/html/wp-content/themes/twentyseventeen
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Sixteen" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentysixteen.2.1.zip'
			sudo unzip twentysixteen.2.1.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Fifteen" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentyfifteen.2.6.zip'
			sudo unzip twentyfifteen.2.6.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Fourteen" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentyfourteen.2.8.zip'
			sudo unzip twentyfourteen.2.8.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Thirteen" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentythirteen.3.0.zip'
			sudo unzip twentythirteen.3.0.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Twelve" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentytwelve.3.1.zip'
			sudo unzip twentytwelve.3.1.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Eleven" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentyeleven.3.4.zip'
			sudo unzip twentyeleven.3.4.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Twenty Ten" ]]; then
			wget 'https://downloads.wordpress.org/theme/twentyten.3.0.zip'
			sudo unzip twentyten.3.0.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		if [[ " ${WP_THEMES[@]} " =~ "Kubrick" ]]; then
			wget 'https://downloads.wordpress.org/theme/default.1.7.2.zip'
			sudo unzip default.1.7.2.zip -d /var/www/html/wp-content/themes/ > /dev/null
		fi

		theme_dir=$(ls /var/www/html/wp-content/themes | grep -E -- 'default|twenty')
		if [[ ! " ${WP_THEMES[@]} " =~ "Twenty Twenty" &&  $theme_dir != "twentytwenty" ]]; then
			wget 'https://downloads.wordpress.org/theme/'
			sudo rm -R /var/www/html/wp-content/themes/twentytwenty
		fi

	}

