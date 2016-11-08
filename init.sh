#!bin/bash

# Remove unwanted software
. ./remove.sh

# Add repos
. ./add-repositories.sh

sudo apt-get update
sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get -y clean

# Variables
FILE='mktemp'
APT_LIST=''

# Installing essentials
while read l; do
	APT_LIST+=" $l"
done <data/essentials.list

sudo apt-get install -f -y -qq $APT_LIST

# Start essential services
# sudo tlp start

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

read -p "\n\nDone with codecs..."
APT_LIST=''

# Install browsers and chat
while read l; do
	APT_LIST+=" $l"
done <data/browsers-and-chat.list

sudo apt-get install -f -y -qq $APT_LIST

read -p "Done with browsers and chat..."
APT_LIST=''

# Installing development
while read l; do
	APT_LIST+=" $l";
done <data/development.list

sudo apt-get install -y -qq $APT_LIST

# VundleVim + Vim config of champions
if [ "$(ls -A ~/.vim)" ]; then
	rm -Rf ~/.vim/*
else
	mkdir ~/.vim
fi
git clone http://github.com/mutewinter/dot_vim.git ~/.vim
bash ~/.vim/scripts/setup
bash ~/.vim/bundle/ctrlp-cmatcher/install.sh

# Powerline + powerline fonts
# Follow answer @ http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
pip install powerline-status

sudo ln -s /usr/bin/nvim /usr/bin/vi

# Pretty fonts
if ![ "$(ls -A ~/.fonts)" ]; then
	mkdir ~/.fonts
fi
mv data/fonts/* ~/.fonts

read -p "Done with development..."
APT_LIST=''

# Installing third party software
. ./third-party-software.sh

read -p "Done with third party..."

# Customisations
. ./customisations.sh

read -p "Done with customisations..."

# Clean up
echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

# Restart

sudo reboot
