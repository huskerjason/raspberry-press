###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################


	function lamp {

		##
		##
		##	Install Apache server, MariaDB database, and PHP scripting
		##	language. WP likes to have bcmath and imagick.
		##
		#######################################################################

		text="Installing the LAMP stack; Apache, MariaDb, and PHP. WordPress will work with just these packages but it like php-bcmath php-imagick php-mysql php-xml php-mbstring php-zip php-curl to be installed too.\n\nApache gets configured for WordPress' pretty permalinks. MariaDB is cleaned up.\n\nPwgen is installed. It's used for phpMyAdmin for the internal user/password and cookie security, and for the secret keys in the WP config file. It's also used to generate the values you didn't define."
		whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'

		sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 mariadb-server php php-bcmath php-imagick php-mysql php-xml php-mbstring php-zip php-curl pwgen -y < /dev/null > /dev/null

		sudo cp files/apache2.conf /etc/apache2/apache2.conf
		sudo a2enmod rewrite > /dev/null
		sudo systemctl restart apache2 > /dev/null

		sudo mariadb -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
		sudo mariadb -e "DELETE FROM mysql.user WHERE User='';"
		sudo mariadb -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';"
		sudo mariadb -e "FLUSH PRIVILEGES;"


		if [[ $WP_DATABASE_PASSWORD == '' ]]; then
			WP_DATABASE_PASSWORD=$(pwgen -s -B 8 1)
		fi

		if [[ $WP_DATABASE_NAME == '' ]]; then
			# all lowercase and no numbers
			WP_DATABASE_NAME=$(pwgen -A -0 6 1)
		fi

		if [[ $WP_PREFIX == '' ]]; then
			# all lowercase and no numbers
			WP_PREFIX=$(pwgen -A -0 3 1)_
		fi

		if [[ $WP_DEBUG == 1 ]]; then
			WP_DEBUG=true
		else
			WP_DEBUG=false
		fi

	}

