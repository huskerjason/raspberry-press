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
##	Install Apache server, MariaDB database, and PHP scripting
##	language. WP likes to have bcmath and imagick.
##
#######################################################################
function lamp {

	text="\nInstalling the LAMP stack; Apache, MariaDb, and PHP. WordPress will work with just these packages but WP likes some other packages to be installed too. Apache will be configured for WordPress' pretty permalinks."
	whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'

#	sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 mariadb-server php7.4 php7.4-{bcmath,imagick,mysql,xml,mbstring,zip,curl} pwgen unzip -y < /dev/null > /dev/null
	sudo DEBIAN_FRONTEND=noninteractive apt install apache2 mariadb-server php php-{bcmath,imagick,mysql,xml,mbstring,zip,curl} pwgen unzip -y < /dev/null > /dev/null

	sudo cp files/apache2.conf /etc/apache2/apache2.conf
	sudo a2enmod rewrite > /dev/null
	sudo systemctl restart apache2 > /dev/null

}

