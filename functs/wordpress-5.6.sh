###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################

##
##
##	First part gets the WP install. unpacks it, and get it in the
##	the right folder. Second part fills in the wp-config with the
##	above parameters
##
#######################################################################


function get_wordpress {

	text="Installing and configuring WordPress."
	whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'


	if [[ $WP_DATABASE_NAME == '' ]]; then
		#  all lowercase and no numbers
		WP_DATABASE_NAME=$(pwgen -A0 4 1)
	fi

	if [[ $WP_DATABASE_USERNAME == '' ]]; then
		#  all lowercase and no numbers
		WP_DATABASE_USERNAME=$(pwgen -A0 4 1)
	fi

	if [[ $WP_DATABASE_PASSWORD == '' ]]; then
		#  upper and lowercase and numbers, I'm just goofing around here with 3 pwgen commands
		WP_DATABASE_PASSWORD=$(pwgen -A0 2 1)$(pwgen 4 1)$(pwgen 4 1)
	fi

	if [[ $WP_PREFIX == '' ]]; then
		#  all lowercase and no numbers
		WP_PREFIX=$(pwgen -A0 3 1)_
	fi

	#  add an underscore to the prefix if there isn't one
	if [[ ${WP_PREFIX: -1} != '_' ]]; then
		WP_PREFIX=$WP_PREFIX"_"
	fi

	if [[ $WP_THEMES == '' ]]; then
		WP_THEMES='"Twenty Twenty"'
	fi

	if [[ $WP_PLUGIN_DELETE == 1 ]]; then
		WP_PLUGIN_DELETE=false
	else
		WP_PLUGIN_DELETE=true
	fi

	if [[ $WP_DEBUG == 1 ]]; then
		WP_DEBUG=true
	else
		WP_DEBUG=false
	fi


	sudo mariadb -e "DROP DATABASE IF EXISTS $WP_DATABASE_NAME;"
	sudo mariadb -e "CREATE DATABASE $WP_DATABASE_NAME;"
	sudo mariadb -e "GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USERNAME'@'localhost' IDENTIFIED BY '$WP_DATABASE_PASSWORD';"
	sudo mariadb -e "FLUSH PRIVILEGES;"


	sudo tar xzf files/wordpress-5.6.tar.gz > /dev/null

	sudo rm -rf /var/www/html/*
	sudo mv wordpress/* /var/www/html/
	sudo rm -r wordpress
	sudo rm /var/www/html/wp-content/plugins/hello.php
	if [[ $WP_PLUGIN_DELETE = true ]]; then
		sudo rm -R /var/www/html/wp-content/plugins/akismet
	fi

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
	sudo sed -i "s|define( 'WP_DEBUG', false );|define( 'WP_DEBUG', $WP_DEBUG );|" /var/www/wp-config.php


	sudo rm -r /var/www/html/wp-content/themes/*

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Twenty One" ]]; then
		sudo unzip files/twentytwentyone.1.1.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Twenty" ]]; then
		sudo unzip files/twentytwenty.1.6.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Nineteen" ]]; then
		sudo unzip files/twentynineteen.1.9.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Seventeen" ]]; then
		sudo unzip files/twentyseventeen.2.5.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi




	if [[ " ${WP_THEMES[@]} " =~ "Twenty Sixteen" ]]; then
		sudo unzip files/twentysixteen.2.3.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Fifteen" ]]; then
		sudo unzip files/twentyfifteen.2.8.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Fourteen" ]]; then
		sudo unzip files/twentyfourteen.3.0.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Thirteen" ]]; then
		sudo unzip files/twentythirteen.3.2.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Twelve" ]]; then
		sudo unzip files/twentytwelve.3.3.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Eleven" ]]; then
		sudo unzip files/twentyeleven.3.6.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi

	if [[ " ${WP_THEMES[@]} " =~ "Twenty Ten" ]]; then
		sudo unzip files/twentyten.3.2.zip -d /var/www/html/wp-content/themes/ > /dev/null
	fi




}
