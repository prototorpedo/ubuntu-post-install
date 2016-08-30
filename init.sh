#!bin/bash

# Add repos
# . ./add-repositories.sh

# sudo apt-get update
# sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get -y clean

# Variables
FILE='mktemp'
APT_LIST=''

# Installing essentials
#sudo apt-get install -f -y -qq $(cat ./data/essentials.list | grep -v //)
while read l; do
	APT_LIST+=" $l"
done <data/essentials.list

# sudo apt-get install -y -qq $APT_LIST
echo $APT_LIST
$APT_LIST=''

# Start essential services
# sudo tlp start
# sudo preload

# Install ZShell and make it default
. ./zsh.sh

read -p "Done with essentials..."

# Install browsers and chat
while read l; do
	APT_LIST+=" $l"
done <data/browsers-and-chat.list

# sudo apt-get install -y -qq $APT_LIST
echo $APT_LIST
APT_LIST=''

# Installing development
while read l; do
	APT_LIST+=" $l";
done <data/development.list

# sudo apt-get install -y -qq $APT_LIST
echo $APT_LIST
APT_LIST=''

# VundleVim + Vim config of champions
# git clone http://github.com/mutewinter/dot_vim.git ~/.vim

# bash ~/.vim/scripts/setup

# bash ~/.vim/bundle/ctrlp-cmatcher/install.sh

alias --global vi='nvim'

read -p "Done with development..."

# Installing third party software
# . ./third-party-software.sh

read -p "Done with third party..."

# Customisations
# . ./customisations.sh

read -p "Done with customisations..."

# Installing codecs & such
# . ./codecs.sh

read -p "Done with codecs..."


# Configuration
#. ./configuration.sh

# read -p "Done with configuration..."

# Clean up
echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

# Restart

sudo reboot
