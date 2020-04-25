###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################


function display_stuff {

	# calculate intervals
	script=$((t2-t1+t4-t3))
	overall=$((t4-t1))

	# display and record intervals in time.txt
	# clear
	cat /proc/device-tree/model | sed 's/\x0//g' > time.txt
	echo >> time.txt
	sed -n 's|arm_freq=|Clock Speed - |p' /boot/config.txt >> time.txt
	date -u -d @$script +'Script  %-M:%S' >> time.txt
	date -u -d @$overall +'Overall %-M:%S' >> time.txt
	echo >> time.txt
	echo 'User     '$WP_DATABASE_USERNAME >> time.txt
	echo 'Password '$WP_DATABASE_PASSWORD >> time.txt


	text=$(<time.txt)'\n\n\n(This data has been stored in time.txt)'
	whiptail --title 'All Done' --infobox "$text" 18 76 --backtitle 'Famous 10 Minute Install'

}

