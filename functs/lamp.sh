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

		text="\nInstalling the LAMP stack; Apache, MariaDb, and PHP. WordPress will work with just these packages but WP likes php-bcmath, php-imagick, php-mysql, php-xml, php-mbstring, php-zip, and php-curl to be installed too.\n\nApache is being configured for WordPress' pretty permalinks. MariaDB is getting set up.\n\nPassword generator will be installed. Pwgen is used for the internal user and password, and cookie security for phpMyAdmin. The WP config file has 8 secret keys that pwgen creates. It's also generates the values you didn't define."
		whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'

		sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 mariadb-server php php-bcmath php-imagick php-mysql php-xml php-mbstring php-zip php-curl pwgen -y < /dev/null > /dev/null

		sudo cp files/apache2.conf /etc/apache2/apache2.conf
		sudo a2enmod rewrite > /dev/null
		sudo systemctl restart apache2 > /dev/null

	}

