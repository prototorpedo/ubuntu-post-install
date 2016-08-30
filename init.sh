#!bin/bash

# Add repos
# . ./add-repositories.sh

# sudo apt-get update
# sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get -y clean

# Variables
FILE='mktemp'

# Installing essentials
#sudo apt-get install -f -y -qq $(cat ./data/essentials.list | grep -v //)
while read l; do
	sudo apt-get install -y -qq $l
done <data/essentials.list

# Start essential services
sudo tlp start
sudo preload

# Install ZShell and make it default
. ./zsh.sh

read -p "Done with essentials..."

# Installing development
sudo apt-get install -y -qq $(cat ./data/development.list | grep -v //)

# VundleVim + Vim config of champions
git clone http://github.com/mutewinter/dot_vim.git ~/.vim

bash ~/.vim/scripts/setup

# bash ~/.vim/bundle/ctrlp-cmatcher/install.sh

alias vi='nvim'

read -p "Done with development..."

# Installing third party software
. ./third-party-software.sh

read -p "Done with third party..."

# Customisations
. ./customisations.sh

read -p "Done with customisations..."

# Installing codecs & such
. ./codecs.sh

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
