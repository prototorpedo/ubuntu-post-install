#!bin/bash

install_list() {
  LIST=''

  while read l; do
  	LIST+=" $l";
  done <$1

  sudo apt-get install -y -qq $LIST
}

# Remove unwanted software
. ./remove.sh

# Add repos
. ./add-repositories.sh

sudo apt-get update
sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get -y clean

# Variables
FILE='mktemp'
APT_LIST=''

# Temp folder
mkdir ./tmp

# Installing essentials
while read l; do
	APT_LIST+=" $l"
done <data/essentials.list

sudo apt-get install -f -y -qq $APT_LIST

# Install ZShell and make it default
. ./zsh.sh

# Nautilus extras
. ./storage.sh

read -p "Done with essentials..."
APT_LIST=''

# Installing codecs & such
while read l; do
	APT_LIST+=" $l"
done <data/codecs.list

sudo apt-get install -f -y -qq $APT_LIST

read -p "Done with codecs..."
APT_LIST=''

# Install browsers and chat
while read l; do
	APT_LIST+=" $l"
done <data/browsers-and-chat.list

sudo apt-get install -f -y -qq $APT_LIST

read -p "Done with browsers and chat..."
APT_LIST=''

. ./development.sh

read -p "Done with development..."
APT_LIST=''

# Installing third party software
. ./third-party-software.sh

read -p "Done with third party..."

# Customisations
. ./customisations.sh

read -p "Done with customisations..."

# Laptop only
if [ -d /proc/acpi/battery/BAT* ]; then
  sudo apt-get install -y tlp tlp-rdw
  sudo tlp start
fi

# Clean up

rm -rf ./tmp

echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

# Restart

sudo reboot
