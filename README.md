# The Famous 10 Minute Raspberry Pi WordPress Installation
WordPress touts their 5 Minute Install. This is the Raspberry Pi version of that. This script will take a freshly minted SD card to fully functional WordPress site in under 10 minutes. This is the easiest and fast install around. Try it and see.
#
The quickest and easiest whay to get the script is to download the zip file, unzip it, then run the script.
~~~bash
wget https://github.com/huskerjason/raspberry-press/archive/master.zip
unzip master.zip
cd raspberry-press-master
bash install.sh

~~~
The script will pause near the end. You should open your browser and type in the IP address. This is the final step to configure WP. It's only a few questions, very quick. Once it says you can sign in, come back and finish the script.
#
The script will tell you what model Pi you are using, it's clock speed, and how long the script ran for. It also will put the results in time-trial.txt. Feel free to post your results and what kind of SD card as an issue if you want. I've noticed that my Samsung 32GB EVO SD card is my best performer. I can do an install in less than 5 minutes with it and a Pi4.
#
Quick overview of the script:
- first step of any Pi project, it does an update and upgrade.
- installs Apache web server, MariaDB database, and PHP scripting language. Apache is configured for permalinks.
- installs phpMyAdmin database manager. The Debian ARM repository is 4.6.6. It sucks so the script does a manual install with 5.0.2.
- downloads WordPress and gets it ready for a configuration run
