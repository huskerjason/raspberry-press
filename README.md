# The Famous 10 Minute Raspberry Pi WordPress Installation
WordPress touts their 5 Minute Install. This is my Raspberry Pi version of that. This script will take a freshly minted SD card to fully functional WordPress site in about 10 minutes. 

This command will do an update, install git, clone the repo, then run the script.
~~~bash
curl https://raw.githubusercontent.com/huskerjason/raspberry-press/master/install.sh | sh
~~~
The script will pause near the end. You should open your browser and type in the IP address. This is the final step to configure WP. Once it says you can sign in, come back and finish the script.
#
The script will tell you what model Pi you are using, it's clock speed, and how long the script ran for. It also will put the results in time-trial.txt. 

#
Quick overview of the script:
- first step of any Pi project, it does an update and upgrade.
- installs Apache web server, MariaDB database, and PHP scripting language. Apache is configured for permalinks.
- installs phpMyAdmin database manager. The Debian ARM repository is 4.6.6. It sucks so the script does a manual install with latest.
- downloads WordPress and gets it ready for a configuration run

