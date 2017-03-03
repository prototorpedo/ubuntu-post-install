#!bin/bash

# PPAs
# Adding from repositories.list
while read l; do
	sudo add-apt-repository ppa:$l
done <data/repositories.list

# Add custom repositories "by hand"

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"

# nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Customisations (platform dependent)
DISTRIB=$(python -mplatform)

if DISTRIB | grep Ubuntu; then
	#statements
	while read l; do
		sudo add-apt-repository $l
	done <data/customs-ubuntu.list
fi
