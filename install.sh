#!/bin/bash

###############################################################################
##
##
##	Famous 10 Minute Raspberry Pi WordPress Install
##
##	Jason Henning
##
##
###############################################################################


# Get starting time. The goal is under 10 minutes after all!
t1=$(date +%s)

DIR_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR_CURRENT=$(pwd)

cd $DIR_SOURCE

. functs/whiptail.sh
. functs/update.sh
. functs/lamp.sh
. functs/phpmyadmin.sh
. functs/wordpress.sh
. functs/wp_permissions.sh
. functs/display_stuff.sh


# There's a bug with whiptail's infobox, this is the work around
TERM=linux


# put the functions to work
get_values

update

lamp

phpmyadmin

get_wordpress


t2=$(date +%s)


# Wait while you do configure WP with a browser
text='The WordPress files have been installed and configure. Please go to your browser and finish the install.\n\nGo to http://'$(hostname -I | awk '{print $1}')
whiptail --backtitle 'Famous 10 Minute Install' --title "Your Turn" --msgbox "$text" 18 76


t3=$(date +%s)


# last step
wp_permissions


t4=$(date +%s)


display_stuff


cd $DIR_CURRENT

