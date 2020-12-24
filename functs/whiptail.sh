###############################################################################
##
##
##    Famous 10 Minute Raspberry Pi WordPress Install
##
##    Jason Henning
##
##
###############################################################################


##
##
##
##
##
##
###############################################################################


function get_values {


	#  There's a bug with whiptail's infobox, this is the work around
	TERM=linux


	#  User defined settings or gshould they be generated
	body="\nThe backbone of WordPress is its database. The database needs a user and a user password. You can sign into phpMyAdmin with the user and password to manage the database. You can define these and other options or you can let the script do it.\n\nDo you want to provide the settings?"
	whiptail --backtitle 'Famous 10 Minute Install' --title 'Settings' --yesno "$body" 18 76
	settings=$?


	if [[ $settings == 0 ]]
	then


		#  Get the wp database name, it can be left empty. Test if not.
		test=x
		until [[ $test == '' && $WP_DATABASE_NAME != 'database' ]]; do
			body="\nIf you would like to supply the database name, it can only contain lowercase letters, numbers, and underscores."
			WP_DATABASE_NAME=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Database' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_DATABASE_NAME | sed 's|[a-z0-9_]||g')
		done


		#  Get the wp and phpamdin user name
		test=x
		until [[ $test == '' ]]; do
			body="\nIf you would like to supply the database user name, it can only contain lowercase letters, numbers, and underscores."
			WP_DATABASE_USERNAME=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'User Name' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_DATABASE_USERNAME | sed 's|[a-z0-9_]||g')
		done


		#  Get the wp and phpMyAdmin password and check it
		body="\nThere aren't any restrictions if you would like to define a password. Strong passwords are recommended but not enforced."
		WP_DATABASE_PASSWORD=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'User Password' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)


		#  Get the prefix and check it or generate one
		test=x
		until [[ $test == '' ]]; do
			body="\nWordPress use wp_ for its table prefixes. A simple security measure is the change it."
			WP_PREFIX=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Table Prefix' --inputbox "$body" 18 76 --nocancel 3>&1 1>&2 2>&3)
			test=$(echo $WP_PREFIX | sed 's|[a-z0-9_]||g')
		done


		WP_PLUGIN_DELETE=1
		#  Turn wp debug on or off
		text="\nThe script is going to delete the worthless Hello Dolly plugin. Akismet is an excellent plugin but it's just in the way if you're developing.\n\nWould you like Akismet deleted?"
		whiptail --backtitle 'Famous 10 Minute Install' --title 'Plugins' --yesno "$text" 18 76
		WP_PLUGIN_DELETE=$?


		#  Pick themes
		WP_THEMES=$(whiptail --backtitle 'Famous 10 Minute Install' --title 'Check list example' --checklist \
		"\nChoose themes you would like installed." 18 76 10 \
		'Twenty Twenty One' '' ON \
		'Twenty Twenty' '' OFF \
		'Twenty Nineteen' '' OFF \
		'Twenty Seventeen' '' OFF \
		'Twenty Sixteen' '' OFF \
		'Twenty Fifteen' '' OFF \
		'Twenty Fourteen' '' OFF \
		'Twenty Thirteen' '' OFF \
		'Twenty Twelve' '' OFF \
		'Twenty Eleven' '' OFF \
		'Twenty Ten' '' OFF 3>&1 1>&2 2>&3)


		#  Turn wp debug on or off
		#  whiptail --backtitle 'Famous 10 Minute Install' --title 'Debug' --yes-button 'Off' --no-button 'On' --yesno "\nWould you like debug turned on for WordPress?\n\nNot sure, choose off." 18 76
		#  WP_DEBUG=$?
		WP_DEBUG='Off'

	fi


}

