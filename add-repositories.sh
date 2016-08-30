#!bin/bash

# PPAs

# Y PPA manager
sudo add-apt-repository ppa:webupd8team/y-ppa-manager

# Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3

# Atom
sudo add-apt-repository ppa:webupd8team/atom

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable

# Java
sudo add-apt-repository ppa:webupd8team/java

# Dropbox
# sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
# sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/dropbox.list'

# Canonical archive
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# Google Chrome and such
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
# sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"

# Youtube-dl
sudo add-apt-repository ppa:nilarimogard/webupd8

# f.lux
sudo add-apt-repository ppa:nathan-renniewaldock/flux

# BTSync
# wget -qO - http://linux-packages.getsync.com/btsync/key.asc | sudo apt-key add -
# sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)"

# nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

# Customisations
sudo add-apt-repository ppa:numix/ppa
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo add-apt-repository ppa:moka/stable


# Install steps for rssowl ?
# wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb
# sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb
# sudo apt-get update
# sudo apt-get install rssowl