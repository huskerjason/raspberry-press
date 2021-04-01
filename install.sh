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


# get the current directory so we can return to it afterwards.
DIR_CURRENT=$(pwd)


# change to the scripts directory
DIR_SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR_SOURCE


# include the files with the functions
. functs/whiptail.sh
. functs/update.sh
. functs/lamp.sh
. functs/phpmyadmin-5.0.4.sh
. functs/wordpress-5.7.sh
. functs/wp-permissions.sh
. functs/display-stuff.sh
. functs/config-wait.sh


# stop the clock
t2=$(date +%s)


# Get the paramers from the user
get_values


# start the clock
t3=$(date +%s)



# update and upgrade
update
# install lamp
lamp
# install phpmyadmin 5.0
phpmyadmin
# install WP
get_wordpress



# stop the clock
t4=$(date +%s)


# let the user to config WP with their browser
config_wait



# start the clock
t5=$(date +%s)




# last step
wp_permissions

# stop the clock
t6=$(date +%s)


display_stuff


cd $DIR_CURRENT


# echo 'WP_DATABASE_NAME     '$WP_DATABASE_NAME
# echo 'WP_DATABASE_USERNAME '$WP_DATABASE_USERNAME
# echo 'WP_DATABASE_PASSWORD '$WP_DATABASE_PASSWORD
# echo 'WP_PREFIX            '$WP_PREFIX
# echo 'WP_PLUGIN_DELETE     '$WP_PLUGIN_DELETE
# echo 'WP_THEMES            '$WP_THEMES
# echo 'WP_DEBUG             '$WP_DEBUG

