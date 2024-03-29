###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################


function update {

		##
		##
		##	Like just about every Pi project, let's start off with getting
		##	up to date
		##
		#######################################################################


		whiptail --title 'Progress' --infobox "\napt update" 18 76 --backtitle 'Famous 10 Minute Install'


		sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
		t4=$(($(date +%s)-t0))

		whiptail --title 'Progress' --infobox "\napt upgrade" 18 76 --backtitle 'Famous 10 Minute Install'
		sudo DEBIAN_FRONTEND=noninteractive apt-get full-upgrade  -yqq < /dev/null > /dev/null
		t5=$(($(date +%s)-t0))

		whiptail --title 'Progress' --infobox "\napt clean" 18 76 --backtitle 'Famous 10 Minute Install'
		sudo DEBIAN_FRONTEND=noninteractive apt-get clean -qq < /dev/null > /dev/null
		t6=$(($(date +%s)-t0))

	}
