###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################


function phpmyadmin {

	##
	##
	##	Install phpMyAdmin
	##
	##	https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10
	##
	#######################################################################

	text="Installing and configuring phpMyAdmin."
	whiptail --title 'Progress' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'



	PMA_CONTROL_USER=$(pwgen -0 -A -1 8)
	PMA_CONTROL_PASSWORD=$(pwgen -s -1 -c -n 16)


	tar xzf files/phpMyAdmin.tar.gz > /dev/null

	mv phpMyAdmin-* phpMyAdmin
	cp files/config.sample.inc.php phpMyAdmin/config.inc.php

	sed -i "18s|''|'$(pwgen -sB 32 1)'|" phpMyAdmin/config.inc.php
	sed -i "43s|\/\/ \$cfg\['Servers']\[\$i]\['controluser'|\$cfg\['Servers']\[\$i]\['controluser'|" phpMyAdmin/config.inc.php
	sed -i "44s|\/\/ \$cfg\['Servers']\[\$i]\['controlpass'|\$cfg\['Servers']\[\$i]\['controlpass'|" phpMyAdmin/config.inc.php
	sed -i "43s|'[^']*'|'$PMA_CONTROL_USER'|3" phpMyAdmin/config.inc.php
	sed -i "44s|'[^']*'|'$PMA_CONTROL_PASSWORD'|3" phpMyAdmin/config.inc.php

	sudo rm -rf /usr/share/phpmyadmin
	sudo mv phpMyAdmin /usr/share/phpmyadmin

	sudo cp files/phpmyadmin.conf /etc/apache2/conf-available/
	sudo mkdir -p /var/lib/phpmyadmin/tmp
	sudo chown -R www-data:www-data /var/lib/phpmyadmin


	sudo mariadb < /usr/share/phpmyadmin/sql/create_tables.sql
	sudo mariadb -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO '$PMA_CONTROL_USER'@'localhost' IDENTIFIED BY '$PMA_CONTROL_PASSWORD';"

	sudo a2enconf phpmyadmin.conf > /dev/null


	sudo systemctl reload apache2 > /dev/null

}
