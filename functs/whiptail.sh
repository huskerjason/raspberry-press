###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################




  function get_values {

		#	Get the WP and phpMyAdmin user and check its validity.
		until [[ $WP_DATABASE_USERNAME != '' && $test == '' ]]; do
			body="\nPlease enter your WordPress and phpMyAdmin user name. User name can only contain lowercase letters, numbers, and underscores.\n\n\n"
			WP_DATABASE_USERNAME=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'User Name' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_DATABASE_USERNAME | sed 's|[a-z0-9_]||g')
		done


		#	Get the wp and phpMyAdmin password and check it
		body="\nYou can enter a password for $WP_DATABASE_USERNAME. No restrictions but should be 8 characters or longer. A random password will be created if one isn't given"
		WP_DATABASE_PASSWORD=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'User Password' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)


		#	Get the wp database name, it can be left empty. Test if not.
		test=x
		until [[ $test == '' ]]; do
			body="\nPlease enter the name of the WordPress database. Database name can only contain lowercase letters, numbers, and underscores.\n\nIf you don't enter a name, one will be randomly generated."
			WP_DATABASE_NAME=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Database' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_DATABASE_NAME | sed 's|[a-z0-9_]||g')
		done


		#	Get the prefix and check it or generate one
		test=x
		until [[ $test == '' ]]; do
			body="\nA simple method to protect your database is to change the table prefix WordPress uses. The default is 'wp_'. The prefix  can only contain lowercase letters, numbers, and underscores. A typical prefix is a few letters and an underscore.\n\nIf one is not provided, a random one will be generated."
			WP_PREFIX=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Table Prefix' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_PREFIX | sed 's|[a-z0-9_]||g')
		done


		#	Pick themes
		WP_THEMES=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Check list example' --checklist \
		"\nChoose themes" 18 76 10 \
		'Twenty Twenty' '' ON \
		'Twenty Nineteen' '' OFF \
		'Twenty Seventeen' '' OFF \
		'Twenty Sixteen' '' OFF \
		'Twenty Fifteen' '' OFF \
		'Twenty Fourteen' '' OFF \
		'Twenty Thirteen' '' OFF \
		'Twenty Twelve' '' OFF \
		'Twenty Eleven' '' OFF \
		'Twenty Ten' '' OFF \
		'Kubrick' '' OFF 3>&1 1>&2 2>&3)


		#	Turn wp debug on or off
		whiptail --backtitle 'Famous 10 Minute Install' --title 'Debug' --yes-button 'Off' --no-button 'On' --yesno "\nWould you like debug turned on for WordPress?\n\nNot sure, answer no." 18 76
		WP_DEBUG=$?

	}

