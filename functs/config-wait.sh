function config_wait {

	first=1
	until [[ $x != '' ]]
	do

		if [[ $first == 1 ]]
		then
			text='The WordPress files have been installed. Please go to your browser to finish the WordPress configuration.\n\nGo to http://'$(hostname -I | awk '{print $1}')
			whiptail --backtitle 'Famous 10 Minute Install' --title "Configure WordPress" --msgbox "$text" 18 76
		else
			text='You need to go to your browser to finish up the WordPress configuration.\n\nGo to http://'$(hostname -I | awk '{print $1}')
			whiptail --backtitle 'Famous 10 Minute Install' --title 'Configure WordPress' --yes-button 'OK' --no-button 'Exit' --yesno "$text" 18 76
			if [[ $? == 1 ]]
			then
				exit
			fi
		fi

		x=$(sudo mariadb -e "SELECT 1 FROM information_schema.tables WHERE table_schema = '$WP_DATABASE_NAME'")

		first=0

	done


}
